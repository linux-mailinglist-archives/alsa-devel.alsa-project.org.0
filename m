Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5084F63F602
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:12:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1E7A1772;
	Thu,  1 Dec 2022 18:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1E7A1772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669914765;
	bh=Ea1T10TIvTWq1qGzKDGwlwL7b3yoxRpm/4uRvtv+CWo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NdvAP6GbSHDlk1dD/bsgJs8M0TyK9hkGRLDsy9AZGObHP5CRZQCdTjrK87t5QHX90
	 QK1p9Yjx4hig0736vqoBqZnhTXqXcuDoQHM57UccvoQvPQ3cjXOGCDu0N+vVi8yFYZ
	 PmxC0wNfYCBrcu8I0AdipTUhJaSgP1HCity+Jtmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8668CF80563;
	Thu,  1 Dec 2022 18:11:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 945A0F804D0; Thu,  1 Dec 2022 18:11:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14E3EF804D0
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:11:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14E3EF804D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WuHnmiUC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 246CE62085;
 Thu,  1 Dec 2022 17:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284BBC43470;
 Thu,  1 Dec 2022 17:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669914660;
 bh=Ea1T10TIvTWq1qGzKDGwlwL7b3yoxRpm/4uRvtv+CWo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WuHnmiUCo8afADDANn9QgPs8GQ7RgKXk3JWzyqJgkXzRW80BMnfJEL8QGFApZlUZX
 G6Mtsue/khwntl0RreET6tboa7twAFk7tY57wyHnJ4KdwiDByjFs2xew/Ywlu0i0D3
 8Bjx2+rroobbTv6y2p7pdvDLLJdBL6oJmgVpfuxJt0VqS82/SnTb6tfvfIT4wfTrvb
 s5WVnm7znQoqVGAFkmtg9cWgCJRPP1HPBZVpYqaTqcXxEBX1iEqVqx094+I6ns6dnc
 rgZw8I2bRIiueukYlKO5B2EOw8Uu+TcPtMiEdu/6/fKmeNdNWZch9WLBzWaD7uE1gO
 QXZ4mPwNZKvaA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v2 3/6] kselftest/alsa: Report failures to set the requested
 channels as skips
Date: Thu,  1 Dec 2022 17:07:42 +0000
Message-Id: <20221201170745.1111236-4-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201170745.1111236-1-broonie@kernel.org>
References: <20221201170745.1111236-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760; i=broonie@kernel.org;
 h=from:subject; bh=Ea1T10TIvTWq1qGzKDGwlwL7b3yoxRpm/4uRvtv+CWo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjiN9eR7uP9EzG5VK5o5gRFLzZsY2kfcSSreuW3Kux
 n6kDJHSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4jfXgAKCRAk1otyXVSH0Fa+B/
 0VJdL2Vj+N0HWUPKMqKb9QvaC/cIsB254npMyUlxVqfzBdfLS0TCgDo1traEiYk8bcVSgYcUgcw7wD
 /smZpJa/v6xrSZOTATC7u2Cxk/rVv4/Co16BmC5HoPuM4dyW1W5XVcCMXDsobhe6KSw7KdzSYP/ING
 ETTjuBZydaNvgK+3hQ1Q0J/2J+tltCVGN3no7lTGg7slXd3WD6G7TpRNGL+BwDCLIoskPoanvrFk1M
 HA79t9MnREVaHgSbmLNqULIWNIfXbzFKE/cR8fRk/lrbfncz66mIy2uPITBYb6ADQhl8gG7l/Nz9Bv
 pHZSsQH7bc3RbCwCeIyOXp07C49koY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kselftest@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

If constraint selection gives us a number of channels other than the one
that we asked for that isn't a failure, that is the device implementing
constraints and advertising that it can't support whatever we asked
for. Report such cases as a test skip rather than failure so we don't have
false positives.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/pcm-test.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index edb820fe2ee6..c701cf507a95 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -241,6 +241,7 @@ static void test_pcm_time1(struct pcm_data *data,
 	snd_pcm_sframes_t frames;
 	long long ms;
 	long rate, channels, period_size, buffer_size;
+	unsigned int rchannels;
 	unsigned int rrate;
 	snd_pcm_uframes_t rperiod_size, rbuffer_size, start_threshold;
 	timestamp_t tstamp;
@@ -310,11 +311,17 @@ static void test_pcm_time1(struct pcm_data *data,
 					   snd_pcm_format_name(format), snd_strerror(err));
 		goto __close;
 	}
-	err = snd_pcm_hw_params_set_channels(handle, hw_params, channels);
+	rchannels = channels;
+	err = snd_pcm_hw_params_set_channels_near(handle, hw_params, &rchannels);
 	if (err < 0) {
 		snprintf(msg, sizeof(msg), "snd_pcm_hw_params_set_channels %ld: %s", channels, snd_strerror(err));
 		goto __close;
 	}
+	if (rchannels != channels) {
+		snprintf(msg, sizeof(msg), "channels unsupported %ld != %ld", channels, rchannels);
+		skip = true;
+		goto __close;
+	}
 	rrate = rate;
 	err = snd_pcm_hw_params_set_rate_near(handle, hw_params, &rrate, 0);
 	if (err < 0) {
-- 
2.30.2

