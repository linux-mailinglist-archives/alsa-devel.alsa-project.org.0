Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4035FFDDE
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 09:30:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C0697209;
	Sun, 16 Oct 2022 09:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C0697209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665905427;
	bh=pyATqjngeVjG957AMkPHoO8+bRo4V0+leDBeUn2/SMQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nan3430yV3luxVsGTHKm++MZcNN/Us2OqnZf/YfxEELJaBrh99RNt5AOCqUkHnf37
	 fVhc8N6IbwQvJYTu++9/jKanowzPmqDvKWzuRJZ4V/ZqUKeTXp+B3/HHVAIy8DjFY1
	 /IdjS6Hz0Zs+T66C7uHLjEkSDsw3lUtJuCAk9N70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43095F8053D;
	Sun, 16 Oct 2022 09:28:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0FFFF801F5; Sun, 16 Oct 2022 01:34:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B58BF8016A
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 01:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B58BF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HOrXZaMA"
Received: by mail-oi1-x236.google.com with SMTP id n130so8676512oia.6
 for <alsa-devel@alsa-project.org>; Sat, 15 Oct 2022 16:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JPQelZHWBax8evlJitFJezC2LMaDni97t0+7jQuxYBI=;
 b=HOrXZaMALQvNg42ExZNKSVde7MtDk23foFTZBE9YpthRYiIX85Sv2QBKRqQChKTcvn
 8FVlW42HHGxgCv7Dm0TI8Z0ua1sjQwGpw7ZBBc2Qp6oOSSQjjW3YpPM8iiqxL7E0P5MQ
 HdK3C17/7t1lkcMpheZTiYHP5fAOUDMplxFQjDm/qhzcxy3N/kyB7X4YinQuPujtsSPk
 thMljsu+4laXO/oeXLb6w4UoJvbnm9feoAbIPMZ4vcGtGy0E5WbN95cfc91Hhocz81gY
 DmVjrgPFTvOdIBOzavtLGiOw+RD3GB4zvzQtv70r9niAqFIfYjNdJDybJ4ueQnSMVfh6
 sXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JPQelZHWBax8evlJitFJezC2LMaDni97t0+7jQuxYBI=;
 b=xkwultoT4R+HvPPle6/+oOQse3zBLgCXKUkLtMCteLoKLxan20A2FK6p3jLVhB/4I3
 5iMalBdtvOhDOAmeq2LRGqmUznMj5lJJfOEvMJPSvsGPvOp10Gk5t/iQ99S11huHs619
 hdm/aPdzDWkJ7QkcLHiemAuwxSllfwxHiGyOGNPChbeIlaQHZ/HWL9AIn3JCIxBgeWtq
 Rj6rmyU9tePhCTSOTPPZdtD9qTGnPg4mZPbAY+tueCHx5GChOmdlGfTJPij8tzi8rZPt
 YPx2MXJZsfChCeUTgyEc3TT7tg7CmJHDWKYKOoi/5SeMWPEJdBrCN6LdK61uZIBozOLL
 f2sg==
X-Gm-Message-State: ACrzQf3g4eVMyEzKeEsmZbKVtnpXvjMea5Be1qkbCqCBHHN1QVWsYTrj
 bWFnsNz+hA/1HjYPhCigpAM=
X-Google-Smtp-Source: AMsMyM7WBa77EYTPszdGxQxNIvpLW3jDSEXTtR17wU4RbToiz0BGZnJfbXq9V1NOG4WnlvAk5Vj9yg==
X-Received: by 2002:a05:6808:bcd:b0:353:d856:64db with SMTP id
 o13-20020a0568080bcd00b00353d85664dbmr2005727oik.168.1665876863699; 
 Sat, 15 Oct 2022 16:34:23 -0700 (PDT)
Received: from bebop.lan
 (2603-8080-2704-6601-b457-170a-9e05-cc6d.res6.spectrum.com.
 [2603:8080:2704:6601:b457:170a:9e05:cc6d])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a4adec3000000b004808e0d8467sm2653858oou.2.2022.10.15.16.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 16:34:23 -0700 (PDT)
From: George Hilliard <thirtythreeforty@gmail.com>
To: Clemens Ladisch <clemens@ladisch.de>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH 2/2] sound: dice: Add support for Firestudio Mobile
Date: Sat, 15 Oct 2022 18:33:30 -0500
Message-Id: <20221015233330.8679-3-thirtythreeforty@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221015233330.8679-1-thirtythreeforty@gmail.com>
References: <20221015233330.8679-1-thirtythreeforty@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 16 Oct 2022 09:28:42 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 George Hilliard <thirtythreeforty@gmail.com>
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

This device is of the same vintage as the already-supported FireStudio,
but with a reduced input (10) and output (6) count.  Add a configuration
block for it.

	$ crpp < /sys/bus/firewire/devices/fw1/config_rom
	               ROM header and bus information block
	               ---------------------------------------------------
	400  0404bc6a  bus_info_length 4, crc_length 4, crc 48234
	404  31333934  bus_name "1394"
	408  e0008102  irmc 1, cmc 1, isc 1, bmc 0, cyc_clk_acc 0, max_rec 8 (512)
	40c  000a9204  company_id 000a92     | Presonus Corporation
	410  047da647  device_id 04047da647  | EUI-64 000a9204047da647

	               root directory
	               ---------------------------------------------------
	414  0006147f  directory_length 6, crc 5247
	418  03000a92  vendor: Presonus Corporation
	41c  8100000a  --> descriptor leaf at 444
	420  17000011  model
	424  8100000e  --> descriptor leaf at 45c
	428  0c0087c0  node capabilities per IEEE 1394
	42c  d1000001  --> unit directory at 430

	               unit directory at 430
	               ---------------------------------------------------
	430  00048030  directory_length 4, crc 32816
	434  12000a92  specifier id: Presonus Corporation
	438  13000001  version
	43c  17000011  model
	440  8100000f  --> descriptor leaf at 47c

	               descriptor leaf at 444
	               ---------------------------------------------------
	444  00057914  leaf_length 5, crc 30996
	448  00000000  textual descriptor
	44c  00000000  minimal ASCII
	450  50726553  "PreS"
	454  6f6e7573  "onus"
	458  00000000

	               descriptor leaf at 45c
	               ---------------------------------------------------
	45c  000792a9  leaf_length 7, crc 37545
	460  00000000  textual descriptor
	464  00000000  minimal ASCII
	468  46495245  "FIRE"
	46c  53545544  "STUD"
	470  494f5f4d  "IO_M"
	474  4f42494c  "OBIL"
	478  45000000  "E"

	               descriptor leaf at 47c
	               ---------------------------------------------------
	47c  000792a9  leaf_length 7, crc 37545
	480  00000000  textual descriptor
	484  00000000  minimal ASCII
	488  46495245  "FIRE"
	48c  53545544  "STUD"
	490  494f5f4d  "IO_M"
	494  4f42494c  "OBIL"
	498  45000000  "E"

Tested-by: George Hilliard <thirtythreeforty@gmail.com>
Signed-off-by: George Hilliard <thirtythreeforty@gmail.com>
---
 sound/firewire/dice/dice-presonus.c | 7 +++++++
 sound/firewire/dice/dice.c          | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/sound/firewire/dice/dice-presonus.c b/sound/firewire/dice/dice-presonus.c
index c85178e64667..8b62495846f1 100644
--- a/sound/firewire/dice/dice-presonus.c
+++ b/sound/firewire/dice/dice-presonus.c
@@ -17,6 +17,12 @@ static const struct dice_presonus_spec dice_presonus_firestudio = {
 	.has_midi = true,
 };
 
+static const struct dice_presonus_spec dice_presonus_firestudio_mobile = {
+	.tx_pcm_chs = {{10, 10, 0}, {0, 0, 0} },
+	.rx_pcm_chs = {{ 6,  6, 0}, {0, 0, 0} },
+	.has_midi = true,
+};
+
 int snd_dice_detect_presonus_formats(struct snd_dice *dice)
 {
 	static const struct {
@@ -24,6 +30,7 @@ int snd_dice_detect_presonus_formats(struct snd_dice *dice)
 		const struct dice_presonus_spec *spec;
 	} *entry, entries[] = {
 		{0x000008, &dice_presonus_firestudio},
+		{0x000011, &dice_presonus_firestudio_mobile},
 	};
 	struct fw_csr_iterator it;
 	int key, val, model_id;
diff --git a/sound/firewire/dice/dice.c b/sound/firewire/dice/dice.c
index f75902bc8e74..f31ea2bb7766 100644
--- a/sound/firewire/dice/dice.c
+++ b/sound/firewire/dice/dice.c
@@ -374,6 +374,14 @@ static const struct ieee1394_device_id dice_id_table[] = {
 		.model_id	= 0x000008,
 		.driver_data	= (kernel_ulong_t)snd_dice_detect_presonus_formats,
 	},
+	// Presonus FireStudio Mobile.
+	{
+		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
+				  IEEE1394_MATCH_MODEL_ID,
+		.vendor_id	= OUI_PRESONUS,
+		.model_id	= 0x000011,
+		.driver_data	= (kernel_ulong_t)snd_dice_detect_presonus_formats,
+	},
 	// Lexicon I-ONYX FW810S.
 	{
 		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
-- 
2.38.0

