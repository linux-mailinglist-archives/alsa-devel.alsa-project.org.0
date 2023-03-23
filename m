Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B78C46C7085
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 19:49:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4734ECE;
	Thu, 23 Mar 2023 19:48:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4734ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679597378;
	bh=0hW7ou4yKKzkx7XuuV6id7JupKItK72eoKHvINXaR/g=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AeYTGBGa4y62qi3KDqSyncFpDsYCMqFun3SwX0O/+CL1VFno6F4wDBZ8I70LtcfXy
	 5ienjID/kC3qAbiPnf2d4UYBQNY/G02A0LzpOeVLi+9OSokeNFVnRMdNtwB3H8Wz5v
	 MyLoRE8OFqDSrHrOZ+36KHGOVd7nDobUtRIZgYo4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20999F80254;
	Thu, 23 Mar 2023 19:48:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24B9DF802E8; Thu, 23 Mar 2023 19:48:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D94B9F800C9
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 19:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D94B9F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HqPjcFMX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C7A24B821EA;
	Thu, 23 Mar 2023 18:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47367C433D2;
	Thu, 23 Mar 2023 18:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679597314;
	bh=0hW7ou4yKKzkx7XuuV6id7JupKItK72eoKHvINXaR/g=;
	h=From:Date:Subject:To:Cc:From;
	b=HqPjcFMXRRGfmNZl9SbWgq2UXbQeJguo7vNCSJgukRxSzyvtqDNFAMquWswFmBzKH
	 xKjxAVul3SMHdelFUoroEgCTEup8RqTfB6AuIJhZD7V99jT7m7uZj6gHB9xyaibfke
	 16yOKZbQwh7/DcFD8S54E532ry0wKtfa47xkzA763w3wVtzJXmqoSnJTNP5XLLItVD
	 +vMRp/P9gYE/gxlaTunFfOW3f5Jrz11gJsPImNvorSwCgM8jWmzazl5TurI1KHMSZp
	 SsaZ01uswqS9vp5kYb/mZ3RBmvU0qZ6mB8cEPPj/dYTlYZ8IcKRjYKH8NUqvSNCgb7
	 vo5SKiIcvIQSQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 23 Mar 2023 18:48:28 +0000
Subject: [PATCH] kselftest/alsa - pcm-test: Don't include diagnostic
 message in test name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-alsa-pcm-test-names-v1-1-8be67a8885ff@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPueHGQC/x2NQQqDQAwAvyI5N6C7WNp+pfSQjWkNraskYgvi3
 117nIFhVnAxFYdbtYLJoq5jLtCcKuCe8ktQu8IQ6hDrGCLSxwknHnAWnzHTII6Ju9ik9nJmukI
 pE7lgMsrcH+13tPehJ5On/v6z+2PbdtOTZcx8AAAA
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
X-Mailer: b4 0.13-dev-bd1bf
X-Developer-Signature: v=1; a=openpgp-sha256; l=1895; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0hW7ou4yKKzkx7XuuV6id7JupKItK72eoKHvINXaR/g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkHJ8ArrjYNOz4WBOk/FnbKxWklUcuQ1FG7p5o1Iov
 0w94Y92JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZByfAAAKCRAk1otyXVSH0KVpB/
 95WrxkkhbtiPCEmm8bG8RydT5ktpFzt1qrLZy0inaBl/htzrlxQVvFAbskJnSTO6BUx9CXLR+NSe0/
 GM6PZaRs9gxNBbJbDUYodigTluRSTvwOmS0veoiCrftnGSquU2nEIgy8N5A0oBFM4/LE9iUI/d8vr/
 XFKowdpqHGO4vWuzrY1AN/xrFpngzgysx7TfGtZDRtEOc+or0zKV6LbFz3WVSsU6XgTZaOPxIjHAhM
 exjLO7OwyMT1RfMUbagFY/QcrBZ+RuiTgL3jtGed5of0fl+ShKjWlNxQxRF9hvOdbryCEMrOWdgz+B
 3x+p8HCg5WPf8VSeyUK9chcrcBai/D
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: C4OYCDNQL6AA5NSDUIMLMIYFI5524PZ6
X-Message-ID-Hash: C4OYCDNQL6AA5NSDUIMLMIYFI5524PZ6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C4OYCDNQL6AA5NSDUIMLMIYFI5524PZ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When reporting errors or skips we currently include the diagnostic message
indicating why we're failing or skipping. This isn't ideal since KTAP
defines the entire print as the test name, so if there's an error then test
systems won't detect the test as being the same one as a passing test. Move
the diagnostic to a separate ksft_print_msg() to avoid this issue, the test
name part will always be the same for passes, fails and skips and the
diagnostic information is still displayed.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/pcm-test.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index 58b525a4a32c..bab56ea67e89 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -489,17 +489,18 @@ static void test_pcm_time(struct pcm_data *data, enum test_class class,
 	}
 
 	if (!skip)
-		ksft_test_result(pass, "%s.%s.%d.%d.%d.%s%s%s\n",
+		ksft_test_result(pass, "%s.%s.%d.%d.%d.%s\n",
 				 test_class_name, test_name,
 				 data->card, data->device, data->subdevice,
-				 snd_pcm_stream_name(data->stream),
-				 msg[0] ? " " : "", msg);
+				 snd_pcm_stream_name(data->stream));
 	else
-		ksft_test_result_skip("%s.%s.%d.%d.%d.%s%s%s\n",
+		ksft_test_result_skip("%s.%s.%d.%d.%d.%s\n",
 				 test_class_name, test_name,
 				 data->card, data->device, data->subdevice,
-				 snd_pcm_stream_name(data->stream),
-				 msg[0] ? " " : "", msg);
+				 snd_pcm_stream_name(data->stream));
+
+	if (msg[0])
+		ksft_print_msg("%s\n", msg);
 
 	pthread_mutex_unlock(&results_lock);
 

---
base-commit: e8d018dd0257f744ca50a729e3d042cf2ec9da65
change-id: 20230323-alsa-pcm-test-names-bcd31b586ca9

Best regards,
-- 
Mark Brown <broonie@kernel.org>

