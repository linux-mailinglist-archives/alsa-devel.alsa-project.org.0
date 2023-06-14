Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D887311EB
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 10:18:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1760843;
	Thu, 15 Jun 2023 10:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1760843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686817088;
	bh=TBUpptwPFlrcyRzvhkCcrsQZ43A4QRh9/+lihcCsSoI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NlE7KJpZyZE8hPDxpHNxGJUeqMBfi1aLfVLnCcUamXsUsus1AXXuUPJPwnnEjTwZp
	 ec7MHK1vSUtB+fbXeGuhimOZRIrObEWEIjN1NBWvt/Z3Y17bd+GtHhrPTwQc6kkfQ4
	 CLlMK0r45AbJPG53WVXv0ceRUD82bUYiHQ/gt8mU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76CE3F80571; Thu, 15 Jun 2023 10:16:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C084F8055C;
	Thu, 15 Jun 2023 10:16:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 613EBF80149; Wed, 14 Jun 2023 14:25:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from cloudserver3200665-3200696.home.pl
 (cloudserver3200665-3200696.home.pl [46.242.240.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8904FF800BA
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 14:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8904FF800BA
Received: from localhost (127.0.0.1) (HELO sv086.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with
 SMTP (IdeaSmtpServer 5.2.0)
 id 2756e75fa4a82ca7; Wed, 14 Jun 2023 14:25:56 +0200
Received: from HEM05L.admytek.local (unknown [213.108.156.244])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by sv086.home.net.pl (Postfix) with ESMTPSA id 13CB94215C;
	Wed, 14 Jun 2023 14:25:56 +0200 (CEST)
From: Lukasz Tyl <ltyl@hem-e.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	pgorgon@hem-e.com,
	Lukasz Tyl <ltyl@hem-e.com>
Subject: [PATCH v2] sound: usb: quirks: add flag for HEM devices to enable
 native DSD playback
Date: Wed, 14 Jun 2023 14:25:24 +0200
Message-Id: <20230614122524.30271-1-ltyl@hem-e.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CLIENT-IP: 213.108.156.244
X-CLIENT-HOSTNAME: 213.108.156.244
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrgedvtddghedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepnfhukhgrshiiucfvhihluceolhhthihlsehhvghmqdgvrdgtohhmqeenucggtffrrghtthgvrhhnpeeghfeuhedvvefhhefghfdtjeekudevudelheekgeegjeduueefgeetfeelueehudenucfkphepvddufedruddtkedrudehiedrvdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvudefrddutdekrdduheeirddvgeegpdhhvghlohepjffgofdthefnrdgrughmhihtvghkrdhlohgtrghlpdhmrghilhhfrhhomhepnfhukhgrshiiucfvhihluceolhhthihlsehhvghmqdgvrdgtohhmqedpnhgspghrtghpthhtohepiedprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehtihifrghisehsuhhsvgdrtghomhdprhgtphhtthhopegrlhhsrgdquggvvhgvlhesrghlshgrqdhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhgohhrghhonheshhgvmhdqvgdrtghomhdprhgtphhtthhopehlthihlheshhgvmhdqvgdrtghomh
X-DCC--Metrics: sv086.home.net.pl 1024; Body=7 Fuz1=8 Fuz2=8
X-MailFrom: ltyl@hem-e.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CEDV3TMUFYN2INAY2ANHTISLTEHRNXVO
X-Message-ID-Hash: CEDV3TMUFYN2INAY2ANHTISLTEHRNXVO
X-Mailman-Approved-At: Thu, 15 Jun 2023 08:14:31 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CEDV3TMUFYN2INAY2ANHTISLTEHRNXVO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This commit adds new DEVICE_FLG with QUIRK_FLAG_DSD_RAW and Vendor Id for
HEM devices which supports native DSD. Prior to this change Linux kernel
was not enabling native DSD playback for HEM devices, and as a result,
DSD audio was being converted to PCM "on the fly". HEM devices,
when connected to the system, would only play audio in PCM format,
even if the source material was in DSD format. With the addition of new
VENDOR_FLG in the quircks.c file, the devices are now correctly
recognized, and raw DSD data is transmitted to the device,
allowing for native DSD playback.

Signed-off-by: Lukasz Tyl <ltyl@hem-e.com>
---
Changes in v2:
 - correct entry position (entry sorted by vendor id).

---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 3ecd1ba7fd4b..6cf55b7f7a04 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2191,6 +2191,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x2ab6, /* T+A devices */
 		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x3336, /* HEM devices */
+		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x3353, /* Khadas devices */
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x3842, /* EVGA */
-- 
2.34.1

