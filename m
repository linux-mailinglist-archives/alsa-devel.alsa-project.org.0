Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B89D2656D4B
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 18:09:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 117F7648B;
	Tue, 27 Dec 2022 18:08:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 117F7648B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672160987;
	bh=rLgMnEoCh4Po4vgPePrdSWrV7l9PvGVlzfYwGi2W6N8=;
	h=From:Date:Subject:References:In-Reply-To:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nvzYC4lgJxYqKeXcHnGg604neyVoB6PJZRDETNabwFK3Fkp/iZgEaBYYc2NbBjkMq
	 rZgs+Kqd64lbSASZrWiqakH0u3kDRvAt37TXsHxyhMUpXFxXQsKiHi1uHOsfy5b1s6
	 hgvhBAz1qtyYYSi4ZEedz3vSQb9avMN+P7bslzN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91D3AF80553;
	Tue, 27 Dec 2022 18:07:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E5EBF80544; Tue, 27 Dec 2022 18:07:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA9BDF800F0
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 18:07:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA9BDF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MdAqPm+d
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D0004B810A8;
 Tue, 27 Dec 2022 17:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4671C43392;
 Tue, 27 Dec 2022 17:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672160847;
 bh=rLgMnEoCh4Po4vgPePrdSWrV7l9PvGVlzfYwGi2W6N8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MdAqPm+d4i9GvZ9jYcEtnjrKfHQT+SHwkbVsSo6/txIZUZU+/koqXShl2czBWcwLY
 1Gma+zgv7yUgHy9U1C0NZ2gSu5IujjVjJXMuieb9HkRORm1sM4GwSOKleqB2rxlgPs
 G/hvt9BNT3/Yux3WYU5dxysHIHyl52G5C+h1Nx81puVCtB12+d0XeiW/prs1LiskKN
 aF2tmv4ZZpD+s+26dpTfy1Hq4gpZkKaPtJSy8JUMkTbo0cRs0p6kKTNuZ2wokLRgAa
 RQRl93tM7RIhYj4vFgsWWybi1HaDNDr+zgSlLApyFdVHvezhue5P7MnyM24HTlHSBC
 alLQZcbVvkOQw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 27 Dec 2022 17:06:49 +0000
Subject: [PATCH v4 4/7] kselftest/alsa: pcm - skip tests when we fail to set
 params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221208-alsa-pcm-test-hacks-v4-4-5a152e65b1e1@kernel.org>
References: <20221208-alsa-pcm-test-hacks-v4-0-5a152e65b1e1@kernel.org>
In-Reply-To: <20221208-alsa-pcm-test-hacks-v4-0-5a152e65b1e1@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
X-Mailer: b4 0.12-dev-7ab1d
X-Developer-Signature: v=1; a=openpgp-sha256; l=3296; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rLgMnEoCh4Po4vgPePrdSWrV7l9PvGVlzfYwGi2W6N8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjqyZCA6KmbKb+V4cZOVDCWU4CaQ4v0Yda63HYpsl5
 FKmUTRCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY6smQgAKCRAk1otyXVSH0BuaB/
 4tG5bK7jC3pNwSraJ8nHV7MboM/RcCC/WeIZNx3KG9H/LXvtTetSimPXggI0IAOaHxZ+JF0QgTSTpK
 zyzJDCFNpTs/Wo669/1U601o5lZE1glydpXhZAY5nP6Q2yDFlzHxtPT1JkthCLk2YvESnf0q3xBeFu
 Tmov+5DIEmbOqtJ7iNvABnYlO/su4ghpI/jFoP1L7CDdn8Wp2PAHOfT/ov2uH9HhE4yJ2P6w3tA9qm
 wC6r+TmFs6Ff6niDCa73j9r7lMgHbg1RHEJFL1GGyg6umrkiOX5u7NVxc0i1BXS64x8PhAPULU2GjX
 m/G7+VOw9Ya4fckJx0WfZvws68N/n1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Since we don't know what the capabilities of an unknown card is any of our
standard tests may fail due to not being supported by the system. Set a
flag once we've configured the stream, just before we start data, to say
that the system accepted our stream configuration.

Since there shouldn't be a use case for tests that are specified for the
individual system failing for those tests we also add a new test which
fails if we are unable to configure the settings specified in the system
specific configuration file.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/pcm-test.c | 39 ++++++++++++++++++++++++++++--
---
 tools/testing/selftests/alsa/pcm-test.c | 39 ++++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index afc616ddc820..5fbb3ff517aa 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -243,6 +243,7 @@ static void test_pcm_time(struct pcm_data *data, enum test_class class,
 	snd_pcm_hw_params_t *hw_params;
 	snd_pcm_sw_params_t *sw_params;
 	const char *test_class_name;
+	bool skip = true;
 
 	switch (class) {
 	case TEST_CLASS_DEFAULT:
@@ -395,6 +396,9 @@ static void test_pcm_time(struct pcm_data *data, enum test_class class,
 			 (long)rperiod_size, (long)rbuffer_size,
 			 (long)start_threshold);
 
+	/* Set all the params, actually run the test */
+	skip = false;
+
 	timestamp_now(&tstamp);
 	for (i = 0; i < 4; i++) {
 		if (data->stream == SND_PCM_STREAM_PLAYBACK) {
@@ -434,12 +438,34 @@ static void test_pcm_time(struct pcm_data *data, enum test_class class,
 	msg[0] = '\0';
 	pass = true;
 __close:
+	switch (class) {
+	case TEST_CLASS_SYSTEM:
+		test_class_name = "system";
+		/*
+		 * Anything specified as specific to this system
+		 * should always be supported.
+		 */
+		ksft_test_result(!skip, "%s.%s.%d.%d.%d.%s.params\n",
+				 test_class_name, test_name,
+				 data->card, data->device, data->subdevice,
+				 snd_pcm_stream_name(data->stream));
+		break;
+	default:
+		break;
+	}
 
-	ksft_test_result(pass, "%s.%s.%d.%d.%d.%s%s%s\n",
-			 test_class_name, test_name,
-			 data->card, data->device, data->subdevice,
-			 snd_pcm_stream_name(data->stream),
-			 msg[0] ? " " : "", msg);
+	if (!skip)
+		ksft_test_result(pass, "%s.%s.%d.%d.%d.%s%s%s\n",
+				 test_class_name, test_name,
+				 data->card, data->device, data->subdevice,
+				 snd_pcm_stream_name(data->stream),
+				 msg[0] ? " " : "", msg);
+	else
+		ksft_test_result_skip("%s.%s.%d.%d.%d.%s%s%s\n",
+				 test_class_name, test_name,
+				 data->card, data->device, data->subdevice,
+				 snd_pcm_stream_name(data->stream),
+				 msg[0] ? " " : "", msg);
 	free(samples);
 	if (handle)
 		snd_pcm_close(handle);
@@ -495,7 +521,8 @@ int main(void)
 		cfg = pcm->pcm_config;
 		if (cfg == NULL)
 			continue;
-		num_tests = conf_get_count(cfg, "test", NULL);
+		/* Setting params is reported as a separate test */
+		num_tests = conf_get_count(cfg, "test", NULL) * 2;
 		if (num_tests > 0)
 			num_pcm_tests += num_tests;
 	}

-- 
2.30.2
