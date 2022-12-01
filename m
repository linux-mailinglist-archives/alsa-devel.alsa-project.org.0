Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2A063F600
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:12:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 640821798;
	Thu,  1 Dec 2022 18:11:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 640821798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669914759;
	bh=s8N5Oq+iQf2kWoVKhV9TosVtMEujg5dxDS+MwW4SuN0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dkt8y/MKfAlY/sWmw8SXGfkX5i5w2azMDRZuaj0E0dT3DPoBuqpzi48fEz5Hejn9M
	 RnwTNvy03B19y96kAvOBmE/ZePjRe4Q8YPXwXmISUtoeRxMkhz9st8pas65s/bw8az
	 XjP875r6XkVehIv09wMQdYCBex1YKT1zuwZmUs2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04D81F8055B;
	Thu,  1 Dec 2022 18:11:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2722F80519; Thu,  1 Dec 2022 18:11:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3907CF80162
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:10:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3907CF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iEEKF6ET"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71E846208C;
 Thu,  1 Dec 2022 17:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E55C433C1;
 Thu,  1 Dec 2022 17:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669914656;
 bh=s8N5Oq+iQf2kWoVKhV9TosVtMEujg5dxDS+MwW4SuN0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iEEKF6EThiiXblEh3If5QhU99QfszaST+MToPAKcJ5tB9FDcxIDmkbgBIIHdxqAkF
 8JRa1BpaP8K2IMESEi+kg6cBzEW0Qo5OBlU+975F9TeXtCBqqZdj9NlkqIZgRHYS+Q
 BdMcDGn/kazxpFS8N/Oe8SBgKxDrRkY+beY8uEpwDujcC2loiB2v1R4+TxDuFG6tHa
 bY1gXRr4nTLzu5pH2xHKk69mvk76U83nVJnAXrBwegMVlv2hscovElVOEb1v6NHVe2
 4rIwSJuyKiYZSSR6w4lm4aPxqg7k+5tHAAX61W1Coy/jyXcM8YoRfWyoBEc16BcFtd
 NM/SgR5qVoDBw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH v2 1/6] kselftest/alsa: Refactor pcm-test to list the tests to
 run in a struct
Date: Thu,  1 Dec 2022 17:07:40 +0000
Message-Id: <20221201170745.1111236-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201170745.1111236-1-broonie@kernel.org>
References: <20221201170745.1111236-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5316; i=broonie@kernel.org;
 h=from:subject; bh=s8N5Oq+iQf2kWoVKhV9TosVtMEujg5dxDS+MwW4SuN0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjiN9cBjBA6RS3uekjazj3ogyq1L7SPoqnaCr9mb7N
 O6fsM0mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY4jfXAAKCRAk1otyXVSH0PVeB/
 9bzyJEnSNgqzUjixTIbb0X8vXskjrz/e7PFiZHIRNjRf4zuGG9Z6Fur6Oj6h310Z3qaUkO1L61Kc5L
 KbAid3VieJUZVh45gMYPKWZzrIkG+LKTg8u18HDNBOJiC1MwgRPTa0zVqOCLnHimJToLb9YF18Oyyz
 +IhF24EjAnfLcVXnd5gcHOK1vK4UNIcrS7n+rILDURgvgjbrqZw5zxPpW/7na6xq/iByUE0HvBZUFN
 2Qhej7OBk/YPZRI3pjs9GamiQEjXeJMIZEgng92TsAvTV1E+qFwjp0gaGZdXpUYJk48oRqAxHp9wVM
 kigTe1Rd3Yj/44eheMEh8DnDEfD53w
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

In order to help make the list of tests a bit easier to maintain refactor
things so we pass the tests around as a struct with the parameters in,
enabling us to add new tests by adding to a table with comments saying
what each of the number are. We could also use named initializers if we get
more parameters.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/pcm-test.c | 53 +++++++++++++++----------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index 6e7dfc395b98..dc36f4099954 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -37,6 +37,15 @@ struct pcm_data *pcm_list = NULL;
 int num_missing = 0;
 struct pcm_data *pcm_missing = NULL;
 
+struct time_test_def {
+	const char *cfg_prefix;
+	const char *format;
+	long rate;
+	long channels;
+	long period_size;
+	long buffer_size;
+};
+
 void timestamp_now(timestamp_t *tstamp)
 {
 	if (clock_gettime(CLOCK_MONOTONIC_RAW, tstamp))
@@ -220,9 +229,7 @@ static void find_pcms(void)
 }
 
 static void test_pcm_time1(struct pcm_data *data,
-			   const char *cfg_prefix, const char *sformat,
-			   long srate, long schannels,
-			   long speriod_size, long sbuffer_size)
+			   const struct time_test_def *test)
 {
 	char name[64], key[128], msg[256];
 	const char *cs;
@@ -244,20 +251,20 @@ static void test_pcm_time1(struct pcm_data *data,
 	snd_pcm_hw_params_alloca(&hw_params);
 	snd_pcm_sw_params_alloca(&sw_params);
 
-	cs = conf_get_string(data->pcm_config, cfg_prefix, "format", sformat);
+	cs = conf_get_string(data->pcm_config, test->cfg_prefix, "format", test->format);
 	format = snd_pcm_format_value(cs);
 	if (format == SND_PCM_FORMAT_UNKNOWN)
 		ksft_exit_fail_msg("Wrong format '%s'\n", cs);
-	rate = conf_get_long(data->pcm_config, cfg_prefix, "rate", srate);
-	channels = conf_get_long(data->pcm_config, cfg_prefix, "channels", schannels);
-	period_size = conf_get_long(data->pcm_config, cfg_prefix, "period_size", speriod_size);
-	buffer_size = conf_get_long(data->pcm_config, cfg_prefix, "buffer_size", sbuffer_size);
+	rate = conf_get_long(data->pcm_config, test->cfg_prefix, "rate", test->rate);
+	channels = conf_get_long(data->pcm_config, test->cfg_prefix, "channels", test->channels);
+	period_size = conf_get_long(data->pcm_config, test->cfg_prefix, "period_size", test->period_size);
+	buffer_size = conf_get_long(data->pcm_config, test->cfg_prefix, "buffer_size", test->buffer_size);
 
-	automatic = strcmp(sformat, snd_pcm_format_name(format)) == 0 &&
-			srate == rate &&
-			schannels == channels &&
-			speriod_size == period_size &&
-			sbuffer_size == buffer_size;
+	automatic = strcmp(test->format, snd_pcm_format_name(format)) == 0 &&
+			test->rate == rate &&
+			test->channels == channels &&
+			test->period_size == period_size &&
+			test->buffer_size == buffer_size;
 
 	samples = malloc((rate * channels * snd_pcm_format_physical_width(format)) / 8);
 	if (!samples)
@@ -293,7 +300,7 @@ static void test_pcm_time1(struct pcm_data *data,
 		if (automatic && format == SND_PCM_FORMAT_S16_LE) {
 			format = SND_PCM_FORMAT_S32_LE;
 			ksft_print_msg("%s.%d.%d.%d.%s.%s format S16_LE -> S32_LE\n",
-					 cfg_prefix,
+					 test->cfg_prefix,
 					 data->card, data->device, data->subdevice,
 					 snd_pcm_stream_name(data->stream),
 					 snd_pcm_access_name(access));
@@ -362,7 +369,7 @@ static void test_pcm_time1(struct pcm_data *data,
 	}
 
 	ksft_print_msg("%s.%d.%d.%d.%s hw_params.%s.%s.%ld.%ld.%ld.%ld sw_params.%ld\n",
-			 cfg_prefix,
+			 test->cfg_prefix,
 			 data->card, data->device, data->subdevice,
 			 snd_pcm_stream_name(data->stream),
 			 snd_pcm_access_name(access),
@@ -411,7 +418,7 @@ static void test_pcm_time1(struct pcm_data *data,
 	pass = true;
 __close:
 	ksft_test_result(pass, "%s.%d.%d.%d.%s%s%s\n",
-			 cfg_prefix,
+			 test->cfg_prefix,
 			 data->card, data->device, data->subdevice,
 			 snd_pcm_stream_name(data->stream),
 			 msg[0] ? " " : "", msg);
@@ -420,11 +427,16 @@ static void test_pcm_time1(struct pcm_data *data,
 		snd_pcm_close(handle);
 }
 
-#define TESTS_PER_PCM 2
+static const struct time_test_def time_tests[] = {
+	/* name          format     rate   chan  period  buffer */
+	{ "test.time1",  "S16_LE",  48000, 2,      512,    4096 },
+	{ "test.time2",  "S16_LE",  48000, 2,    24000,  192000 },
+};
 
 int main(void)
 {
 	struct pcm_data *pcm;
+	int i;
 
 	ksft_print_header();
 
@@ -432,7 +444,7 @@ int main(void)
 
 	find_pcms();
 
-	ksft_set_plan(num_missing + num_pcms * TESTS_PER_PCM);
+	ksft_set_plan(num_missing + num_pcms * ARRAY_SIZE(time_tests));
 
 	for (pcm = pcm_missing; pcm != NULL; pcm = pcm->next) {
 		ksft_test_result(false, "test.missing.%d.%d.%d.%s\n",
@@ -441,8 +453,9 @@ int main(void)
 	}
 
 	for (pcm = pcm_list; pcm != NULL; pcm = pcm->next) {
-		test_pcm_time1(pcm, "test.time1", "S16_LE", 48000, 2, 512, 4096);
-		test_pcm_time1(pcm, "test.time2", "S16_LE", 48000, 2, 24000, 192000);
+		for (i = 0; i < ARRAY_SIZE(time_tests); i++) {
+			test_pcm_time1(pcm, &time_tests[i]);
+		}
 	}
 
 	conf_free();
-- 
2.30.2

