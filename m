Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DC94668FF
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 18:20:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0426329B8;
	Thu,  2 Dec 2021 18:19:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0426329B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638465605;
	bh=kDkKNQtT+sYBiIoWMUFDY/PeEOYeAS6RGz+rfLlVIwo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pv0Ulwhu3ia18ML0gVN0RVHhiqhYtyDKjxh375G+dOuNrcC/SHu2OuqXE3+VOCIEA
	 z/bBQ1GEqPHIHZYDNBsjdWfCVDk/LjUZ/LPjO8jtHpANng4jsw9U/cpsfvOY0pIslD
	 iKKjGWW46HBibHkhs+VGCrsFXUWOiMJINg6RRgh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E021F802E0;
	Thu,  2 Dec 2021 18:18:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63B9FF802A0; Thu,  2 Dec 2021 18:18:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AD7FF800CE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 18:18:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AD7FF800CE
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 5A770C80089;
 Thu,  2 Dec 2021 18:18:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id zgTVVGGim0y8; Thu,  2 Dec 2021 18:18:36 +0100 (CET)
Received: from [192.168.178.21] (host-212-18-30-247.customer.m-online.net
 [212.18.30.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id F22C1C8006F;
 Thu,  2 Dec 2021 18:18:35 +0100 (CET)
Subject: Re: [PATCH] ALSA: hda/realtek: Fix quirk for TongFang PHxTxX1
To: Takashi Iwai <tiwai@suse.de>
References: <20211202152843.818617-1-wse@tuxedocomputers.com>
 <s5ho85zt3xm.wl-tiwai@suse.de>
 <aceae41d-eeaa-9f13-2e37-9fce08e693c6@tuxedocomputers.com>
 <s5hbl1zt1wy.wl-tiwai@suse.de>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <285f691b-2c0c-d032-cb96-45e9e939eabb@tuxedocomputers.com>
Date: Thu, 2 Dec 2021 18:18:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <s5hbl1zt1wy.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com
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


Am 02.12.21 um 17:19 schrieb Takashi Iwai:
> On Thu, 02 Dec 2021 17:02:51 +0100,
> Werner Sembach wrote:
>> Am 02.12.21 um 16:35 schrieb Takashi Iwai:
>>> On Thu, 02 Dec 2021 16:28:43 +0100,
>>> Werner Sembach wrote:
>>>> This fixes the SND_PCI_QUIRK(...) of the TongFang PHxTxX1 barebone. This
>>>> fixes the issue of sound not working after s3 suspend.
>>>>
>>>> When waking up from s3 suspend the Coef 0x10 is set to 0x0220 instead of
>>>> 0x0020. Setting the value manually makes the sound work again. This patch
>>>> does this automatically.
>>>>
>>>> While being on it, I also fixed the comment formatting of the quirk.
>>>>
>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>> Cc: <stable@vger.kernel.org>
>>> Please try to put Fixes tag as this is a fix for the existing change.
>> Sorry, wasn't aware of this. I guess it's [PATCH Fixes] as the beginning of the subject line?
> No, the Fixes tag is another line you add around your Signed-off-by
> line for indicating that that the patch is for fixing the given
> commit.  In your case, it'll be like
>
> Fixes: dd6dd6e3c791 ("ALSA: hda/realtek: Add quirk for TongFang PHxTxX1")
>
>
> HTH,
>
> Takashi

Thanks, that was indeed very helpful.

Sorry for still making noob mistakes.

