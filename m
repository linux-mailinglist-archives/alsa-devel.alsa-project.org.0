Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E895B7E9BA8
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:58:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 343C8DEB;
	Mon, 13 Nov 2023 12:58:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 343C8DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876736;
	bh=nqPlvdt+mOJGlFPheRhyF+ziMl2H+4kpaUZ2LB9iSOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ml6SJWA/1yM+IW6VCwp4rRShSUxlUtD2TxK74XhrayxLqButdtk2qhadF18quAXhJ
	 Ds5vYjTlBcBjKD60IEtgR8/mIwwJhSlA6FmZOhIplO47fiJm1vPY/qX0O/ZHnrXDzj
	 pWlBQa8UVSxFgEgZNakOl1Y9iu48x/LnYGQ/XSFs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99ABBF8057F; Mon, 13 Nov 2023 12:57:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB789F80589;
	Mon, 13 Nov 2023 12:57:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90029F8022B; Mon, 13 Nov 2023 11:22:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 995D2F80549
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 11:22:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 995D2F80549
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F3639B80D28;
	Mon, 13 Nov 2023 10:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A338EC433CB;
	Mon, 13 Nov 2023 10:22:18 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	alsa-devel@alsa-project.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 8/8] test-media: add vim2m-audio test
Date: Mon, 13 Nov 2023 11:18:49 +0100
Message-ID: 
 <56cdfc8a975b2daef707011c42de00ffa893ae0b.1699870530.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: 
 <7889c22b922214ebcc0e62feeeb167b40d5042ec.1699870530.git.hverkuil-cisco@xs4all.nl>
References: 
 <7889c22b922214ebcc0e62feeeb167b40d5042ec.1699870530.git.hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: SRS0=a+Jp=G2=xs4all.nl=hverkuil-cisco@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MAZS5A4QBITV7WZNGTUDHDNMLCFHGQOX
X-Message-ID-Hash: MAZS5A4QBITV7WZNGTUDHDNMLCFHGQOX
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:57:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MAZS5A4QBITV7WZNGTUDHDNMLCFHGQOX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Run v4l2-compliance for the vim2m-audio driver.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 contrib/test/test-media | 88 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 2 deletions(-)

diff --git a/contrib/test/test-media b/contrib/test/test-media
index afe20760..1186f02f 100755
--- a/contrib/test/test-media
+++ b/contrib/test/test-media
@@ -7,6 +7,7 @@
 vidtv=0
 vivid=0
 vim2m=0
+vim2m_audio=0
 vimc=0
 vicodec=0
 cec=0
@@ -53,13 +54,14 @@ if [ -z "$1" ]; then
 	echo Test Targets:
 	echo "vivid: test the vivid driver"
 	echo "vim2m: test the vim2m driver"
+	echo "vim2m-audio: test the vim2m-audio driver"
 	echo "vimc: test the vimc driver"
 	echo "vicodec: test the vicodec driver"
 	echo "vidtv: test the vidtv driver"
 	echo "cec: adds the vivid CEC compliance tests, except for the CEC standby/wakeup tests."
 	echo "cec-pwr: adds the vivid CEC compliance tests, including the CEC standby/wakeup tests."
-	echo "all: equals 'vivid vim2m vimc vicodec vidtv cec cec-pwr'"
-	echo "mc: equals 'vivid vim2m vimc vicodec vidtv'"
+	echo "all: equals 'vivid vim2m vim2m-audio vimc vicodec vidtv cec cec-pwr'"
+	echo "mc: equals 'vivid vim2m vim2m-audio vimc vicodec vidtv'"
 	exit 0
 fi
 
@@ -116,6 +118,7 @@ while [ ! -z "$1" ]; do
 		vidtv=1
 		vivid=1
 		vim2m=1
+		vim2m_audio=1
 		vimc=1
 		vicodec=1
 		cec=1
@@ -124,6 +127,7 @@ while [ ! -z "$1" ]; do
 	mc)
 		vivid=1
 		vim2m=1
+		vim2m_audio=1
 		vimc=1
 		vicodec=1
 		vidtv=1
@@ -137,6 +141,9 @@ while [ ! -z "$1" ]; do
 	vim2m)
 		vim2m=1
 		;;
+	vim2m-audio)
+		vim2m_audio=1
+		;;
 	vimc)
 		vimc=1
 		;;
@@ -421,6 +428,83 @@ if [ $vim2m -eq 1 -a $setup -eq 0 ]; then
 	echo
 fi
 
+
+if [ $vim2m_audio -eq 1 ]; then
+	rmmod vim2m-audio 2&>/dev/null
+	modprobe vim2m-audio
+	sleep $modprobe_time
+	dmesg -n notice
+
+	if ! $v4l2_ctl -z platform:vim2m-audio ; then
+		echo "FAIL: the vim2m-audio module failed to load" | tee -a $tmp
+		echo "Grand Total for vim2m-audio: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
+		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
+		rmmod vivid
+		exit 0
+	fi
+fi
+
+if [ $vim2m_audio -eq 1 -a $setup -eq 0 ]; then
+	echo
+	echo vim2m-audio compliance tests | tee /dev/kmsg
+	echo
+	date
+	stdbuf -oL $v4l2_compliance -m platform:vim2m-audio -z platform:vivid-002 -e vivid-002-vid-cap -s10 -P -a 2>&1 | tee -a $tmp
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo unbind vim2m-audio | tee /dev/kmsg
+	echo
+	echo -n vim2m-audio.0 >/sys/bus/platform/drivers/vim2m-audio/unbind
+	sleep $unbind_time
+	echo
+	echo rebind vim2m-audio | tee /dev/kmsg
+	echo
+	echo -n vim2m-audio.0 >/sys/bus/platform/drivers/vim2m-audio/bind
+	sleep 1
+	echo
+	echo second unbind vim2m-audio | tee /dev/kmsg
+	echo
+	for i in `$v4l2_ctl -z platform:vim2m-audio --list-devices`; do
+		let "t = 1 + $RANDOM / 4096"
+		echo $i: sleep ${t}s
+		sleep $t <$i &
+	done
+	sleep 1
+	echo
+	echo -n vim2m-audio.0 >/sys/bus/platform/drivers/vim2m-audio/unbind
+	sleep $reunbind_time
+	echo
+	echo rmmod vim2m-audio | tee /dev/kmsg
+	echo
+	rmmod vim2m-audio
+	sleep $rmmod_time
+	if [ $kmemleak -eq 1 ]; then
+		echo
+		echo kmemleak results for vim2m-audio:
+		echo
+		echo scan >/sys/kernel/debug/kmemleak
+		cat /sys/kernel/debug/kmemleak
+		echo
+		echo end of kmemleak results
+		echo clear >/sys/kernel/debug/kmemleak
+	fi
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+fi
+
 if [ $vimc -eq 1 ]; then
 	rmmod vimc 2&>/dev/null
 	modprobe vimc
-- 
2.42.0

