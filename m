Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5227656D4E
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 18:10:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9F823899;
	Tue, 27 Dec 2022 18:09:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9F823899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672161015;
	bh=D42E5y8FdtxfQXs/2hUywnM+rHr45IO+HscRXS6eAM4=;
	h=From:Date:Subject:References:In-Reply-To:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NB8nUyRz4lT9R/6RwjxDfELvmWR2YialtYruqJKztBVY/GF5IcaZWOO2MCOWcq7QP
	 bCWj3WYV3GH3jAqx+Jk9BLI1aLNdKA5I3guItLsikfGAluTiz/IHSV3c/3d5mVHFz4
	 7qxT7VsRdb96Itr2A8jEEWQThffdqnSjJP6CSwT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09925F8056F;
	Tue, 27 Dec 2022 18:07:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 528A7F80567; Tue, 27 Dec 2022 18:07:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A775BF80552
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 18:07:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A775BF80552
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z6L3rseO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 45188B810A4;
 Tue, 27 Dec 2022 17:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D40C433F2;
 Tue, 27 Dec 2022 17:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672160851;
 bh=D42E5y8FdtxfQXs/2hUywnM+rHr45IO+HscRXS6eAM4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Z6L3rseOX3KHQkU1Nm/L3Dd8SZM0rWsj5EoTT6jP9nJo+4k81C6ZkBKhEx0YPd9rU
 3biq7UZS7kmdMvQTj/+/ufxLEFAA9dQtbQ13sOjvaQryTz6ugmTarAvBrhnqc+knbk
 FU0cDWdir3VarbRObpzwHx/i4BZmig9EKG5I041Jn1RlyjoFVFaTQn8CxndttWPNpm
 WxthkWXyAqiOaor8CLFquGyIFb7NwNx/LCQlYaVYpiIVzXJXc+PgDjwCWJOeJSL3og
 iptpp4bxNhP+Drm36eNoqbiAmfs+5md3LaKrIoFcpIsfUHg/8DjxvpK1PYB9lSI4od
 Oukwfv4SqwSxw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 27 Dec 2022 17:06:51 +0000
Subject: [PATCH v4 6/7] kselftest/alsa: pcm - Provide descriptions for the
 default tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221208-alsa-pcm-test-hacks-v4-6-5a152e65b1e1@kernel.org>
References: <20221208-alsa-pcm-test-hacks-v4-0-5a152e65b1e1@kernel.org>
In-Reply-To: <20221208-alsa-pcm-test-hacks-v4-0-5a152e65b1e1@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Shuah Khan <shuah@kernel.org>
X-Mailer: b4 0.12-dev-7ab1d
X-Developer-Signature: v=1; a=openpgp-sha256; l=942; i=broonie@kernel.org;
 h=from:subject:message-id; bh=D42E5y8FdtxfQXs/2hUywnM+rHr45IO+HscRXS6eAM4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjqyZEyfwXa5iZU6mVgxLzWh/Mj1JsaY3GxX6l7f1q
 ZmUBMS2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY6smRAAKCRAk1otyXVSH0HgWB/
 9a3SG6C4gW8prD/27zhse5YklxGE1xTvfyrbvpu3VvneVrE2T6oE3ytitNwiF0vJYF+9x0USrUcNcq
 EuKIp4KUVC5iCbchad17sKWL4s7kx8qpfrTUu/kA2DhTAztTAnX5CdbSgFHoeVLzE5RVb2P/QyBwyD
 MiSJTsuNbai9Rm3KNvzklhquDKbZk7OOKwhYS3nwt1G1WuxnpgRS4cqEIaJVfVN+RXcNT6TfmCNASW
 enHXned6BDDh8PR49/P7Hm5QdCrJg/faJ1nqyawSEPX6kWmBFGz6PHZg3y8/ML9bcYIxkjCPAnXlIQ
 2HSyKqvZIGA7QiI3lttfsJy6wQ8OAo
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

Help people understand what the standard tests are trying to cover by
providing descriptions which both serve as comments in the file and log
messages in the program's output.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/alsa/pcm-test.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/alsa/pcm-test.conf b/tools/testing/selftests/alsa/pcm-test.conf
index 473a19251b49..1662a8c7073e 100644
--- a/tools/testing/selftests/alsa/pcm-test.conf
+++ b/tools/testing/selftests/alsa/pcm-test.conf
@@ -1,4 +1,5 @@
 pcm.test.time1 {
+	description "48kHz stereo small periods"
 	format S16_LE
 	alt_formats [ S32_LE ]
 	rate 48000
@@ -7,6 +8,7 @@ pcm.test.time1 {
 	buffer_size 4096
 }
 pcm.test.time2 {
+	description "48kHz stereo large periods"
 	format S16_LE
 	alt_formats [ S32_LE ]
 	rate 48000

-- 
2.30.2
