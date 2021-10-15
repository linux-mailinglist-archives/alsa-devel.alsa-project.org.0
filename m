Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F44942EB3F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 10:14:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94E0E16BE;
	Fri, 15 Oct 2021 10:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94E0E16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634285648;
	bh=vP3hClcV6/Kk3JOiF+qvwrqyBSsG+aW7ehh14med6iE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nX3G9K/Iq08Fhhu1Mm6PvbUzdlJnXjN00JvFOeimL01ML+FVWH7cI/nQKusAbPpjf
	 RtkqpAmOBRLMKEWfqzGgH+xDbp9+Fq8+2emHnD6dk8PEqRaMWDs/muo1j0tMbf5076
	 SYO9irpHj3bW95QBPJlReYb/W2RpFOJyzFrE/YmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 284FEF80548;
	Fri, 15 Oct 2021 10:10:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EA50F80167; Fri, 15 Oct 2021 10:09:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01829F80430
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 10:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01829F80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="U8CeSNXv"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EeG0NORM"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 898403201D11;
 Fri, 15 Oct 2021 04:08:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 15 Oct 2021 04:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=2hpr/MXJfcxez
 I5KLHLw0BQf4sAtUYpUA+PIEWG6zT0=; b=U8CeSNXvA6nD9ZzjuYvzRmejHxOZC
 KaTLaID2Y9r4tDzw2H1dH6twqX8xzGmq8zpEqqJvF7Ut1/N457K+Q6/g/UAugR/P
 lyx00LxwAW/0uc1Cokow1XeTHxcsmSN2oOBFXrlZqX9NrwJT3I06kBgagY3VhT/v
 W7TGFT+TQt6stDycHQejl+O5VkIhFEK89aXQ6IWpa8etvOZSS5xfKuwngF0n0ZGS
 aqEPCe7ZoLBJU/ELrubuaPhy0yXUvGd/KpY/NTmN32EtsX1zx/0jbpwZcHg5g1ed
 jTf2CeKwa6vSNO3gJepvYyQpEyBkZ6aUSfYHtCRRLmhjqA+fcn/DwxjZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=2hpr/MXJfcxezI5KLHLw0BQf4sAtUYpUA+PIEWG6zT0=; b=EeG0NORM
 VFsgtAsXTxkuR+r3i8tEM9K2dec4Z4CLoXn7Bve5Uy2CPjMDpRCWODdGK6EJOJGa
 zXiGA8kcB24H9rcnc8X2C38JqqeR3Hkpddxr7Z98rBtkP8OxWWpu5BP5BjfiyDrT
 c7VhF2rhZwcnyFfn8ZO9Mxw0k+fd02m75pbhd19784uXKqq6rLbBCBFTrS7tvWEp
 q99qdcVAkAPDqdQKWobt5VWHBIyV83AKV5ccAgSffc/ocel8hJAijIBQ3TJmq+sw
 KO5gQ8fUFtSl1eP9zh9KUm23tV/NJfIeHrnmBEAulXLEPmAwjEg1ssLImthTeMGK
 pslcxuuYRKShqw==
X-ME-Sender: <xms:DzdpYWqjxSxYh25KTwkshE-hCrhmTkVn5lVI0aEUWwA_oo9WHveEeA>
 <xme:DzdpYUrspXquR_3xkzYTofThShPGd55SKPIbK5fPnyGzbOVRa3txS3GZz1z_iZyXH
 wvH1IPdeOH_V8n-KtM>
X-ME-Received: <xmr:DzdpYbNviEJtVCUg9VJ82F7PvIrvczwRZUuuz8SACuWwQMP9TJHyds8vWF9kdgR_InmWXvscTLWiwGq24uJQVDd-fojaIm9z1UOK2QSZyvKhYgNTD48d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddugecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:DzdpYV7NWWBC5uoENNGzgQBLWZTJMJCGbx3pgtVXoQabCWV3r3J2PA>
 <xmx:DzdpYV6pqse7yg_6FjmXk15WXIT0KSnzpjBemrWGnlUzcbaq_mLrjA>
 <xmx:DzdpYVgtY3-Vz8lLKIeANxE9IwDPHHqJxEr6cqIES_3JeIZ0lMjyVQ>
 <xmx:DzdpYVFEklW1UMqLijncZVA3OXcqIRD5b2Wh3jjrzQafo23zN2UFmg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 04:08:45 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 06/11] ALSA: firewire-motu: parse messages for output
 parameters in register DSP model
Date: Fri, 15 Oct 2021 17:08:21 +0900
Message-Id: <20211015080826.34847-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015080826.34847-1-o-takashi@sakamocchi.jp>
References: <20211015080826.34847-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ffado-devel@lists.sourceforge.net, alsa-devel@alsa-project.org,
 clemens@ladisch.de
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

This commit parses message and cache current parameters of output
function, commonly available for all of register DSP model.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/firewire.h                         | 10 ++++++++++
 .../firewire/motu/motu-register-dsp-message-parser.c  | 11 ++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index f663a26c5205..16ca7b43568b 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -160,6 +160,10 @@ struct snd_firewire_motu_register_dsp_meter {
  *			       Audio Express.
  * @mixer.output.paired_volume: The volume of paired output from mixer.
  * @mixer.output.paired_flag: The flag of paired output from mixer.
+ * @output.main_paired_volume: The volume of paired main output.
+ * @output.hp_paired_volume: The volume of paired hp output.
+ * @output.hp_paired_assignment: The source assigned to paired hp output.
+ * @output.reserved: Padding for 32 bit alignment for future extension.
  *
  * The structure expresses the set of parameters for DSP controlled by register access.
  */
@@ -177,6 +181,12 @@ struct snd_firewire_motu_register_dsp_parameter {
 			__u8 paired_flag[SNDRV_FIREWIRE_MOTU_REGISTER_DSP_MIXER_COUNT];
 		} output;
 	} mixer;
+	struct {
+		__u8 main_paired_volume;
+		__u8 hp_paired_volume;
+		__u8 hp_paired_assignment;
+		__u8 reserved[5];
+	} output;
 };
 
 // In below MOTU models, software is allowed to control their DSP by command in frame of
diff --git a/sound/firewire/motu/motu-register-dsp-message-parser.c b/sound/firewire/motu/motu-register-dsp-message-parser.c
index 867cb09a3521..244f7ada851f 100644
--- a/sound/firewire/motu/motu-register-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-register-dsp-message-parser.c
@@ -54,7 +54,7 @@ enum register_dsp_msg_type {
 	MIXER_OUTPUT_PAIRED_FLAG = 0x06,
 	MAIN_OUTPUT_PAIRED_VOLUME = 0x07,
 	HP_OUTPUT_PAIRED_VOLUME = 0x08,
-	HP_OUTPUT_ASSIGN = 0x09,
+	HP_OUTPUT_PAIRED_ASSIGNMENT = 0x09,
 	// Transferred by all models but the purpose is still unknown.
 	UNKNOWN_0 = 0x0a,
 	// Specific to 828mk2, 896hd, Traveler.
@@ -210,6 +210,15 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 				}
 				break;
 			}
+			case MAIN_OUTPUT_PAIRED_VOLUME:
+				parser->param.output.main_paired_volume = val;
+				break;
+			case HP_OUTPUT_PAIRED_VOLUME:
+				parser->param.output.hp_paired_volume = val;
+				break;
+			case HP_OUTPUT_PAIRED_ASSIGNMENT:
+				parser->param.output.hp_paired_assignment = val;
+				break;
 			case METER:
 			{
 				u8 pos;
-- 
2.30.2

