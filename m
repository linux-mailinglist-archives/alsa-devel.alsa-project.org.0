Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3E82E2021
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 18:48:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 879A317DB;
	Wed, 23 Dec 2020 18:48:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 879A317DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608745735;
	bh=Cc2KblsMMsff70upoJ+KBtGICOZZreHb0cXrnvp+UZI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HvNIahpco38jHLDeTvB41JaRHuzTc8qzVYNKH60MISi1l8Au/ogcXBa+InWR0aVT2
	 X/taGUbgRJRIqq92xtnbMdlgfijJAf5ceupTpm1tRyLTClXmEO67NmDgNSLgVXJCW0
	 tN5WhtGeG/2r/epLm93w6iZJADKIcHHu6nrptjd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56969F804FC;
	Wed, 23 Dec 2020 18:44:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F72EF804D6; Wed, 23 Dec 2020 18:44:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EA0DF8021C
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 18:44:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EA0DF8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="Oen8ZSg5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=ptErSt0dW5D12UWzQOQGAF3uLKabVk2M4jFCGw0i54c=; b=Oen8ZSg5gWzF0WUD9rTBNXdm4t
 CR2H4E2rpbCQSqcgaGU2EEzh0EfGPjeBjzO4eTx86Y0szf7NagcZvBtke/GI3byJIpCmsCMggfSvE
 7x7e2IGcI+UrwbbTwmc4mU5Oi+DE4vMDLbk35MtogLuMcKIwaWCC/kXChvPatZN+/3oyGDnCFfboW
 +bDrtIW+IO7o7mni7NNWm6oJsyuBQCuSUuvtCJYr8nDakgWcrTIdmmV2R6jexWU+HcO6mQjDuRM2t
 UQLNM9Q2tkYjTtW2mMu+Qen2Gn9Jkv35cSNBmJHxw7O/gMdvr0zR8tjt4dwUd4s8QtqwaPhuQxZ6E
 fgU33xtw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1ks8Ba-0001PU-T9; Wed, 23 Dec 2020 18:44:30 +0100
Received: from [62.216.202.54] (helo=lars-desktop.fritz.box)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1ks7qo-000Crk-JK; Wed, 23 Dec 2020 18:23:02 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 11/18] ALSA: usb: Use DIV_ROUND_UP() instead of open-coding it
Date: Wed, 23 Dec 2020 18:22:22 +0100
Message-Id: <20201223172229.781-11-lars@metafoo.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201223172229.781-1-lars@metafoo.de>
References: <20201223172229.781-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26026/Wed Dec 23 13:53:03 2020)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>
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

Use DIV_ROUND_UP() instead of open-coding it. This documents intent
and makes it more clear what is going on for the casual reviewer.

Generated using the following the Coccinelle semantic patch.

// <smpl>
@@
expression x, y;
@@
-(((x) + (y) - 1) / (y))
+DIV_ROUND_UP(x, y)
// </smpl>

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 sound/usb/mixer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 12b15ed59eaa..412fcd817ecc 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -254,7 +254,7 @@ static int get_relative_value(struct usb_mixer_elem_info *cval, int val)
 	if (val < cval->min)
 		return 0;
 	else if (val >= cval->max)
-		return (cval->max - cval->min + cval->res - 1) / cval->res;
+		return DIV_ROUND_UP(cval->max - cval->min, cval->res);
 	else
 		return (val - cval->min) / cval->res;
 }
@@ -1338,7 +1338,7 @@ static int mixer_ctl_feature_info(struct snd_kcontrol *kcontrol,
 		}
 		uinfo->value.integer.min = 0;
 		uinfo->value.integer.max =
-			(cval->max - cval->min + cval->res - 1) / cval->res;
+			DIV_ROUND_UP(cval->max - cval->min, cval->res);
 	}
 	return 0;
 }
-- 
2.20.1

