Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F365C5A4579
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Aug 2022 10:52:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1820685D;
	Mon, 29 Aug 2022 10:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1820685D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661763152;
	bh=SmEK2tutsWMD/ZYQ8Qrr9Hh7SjgGABH/Y7JuPteyB74=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IViRcBviwi/wqOL8Uxtg4lwV5b29U7G6OonRZeJZkdXskThvBx1oejA/67eA5Bjrx
	 MxW4NLyF90pOqu6xC+mzaE7PIbh5u3t4sPmT5CW8r0uvnIxJCrfPsgF74/S3QkC66l
	 OC4n5QVKsLAXcOyU39VrmroKSmypYmt4B4BKkfjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67EF5F80217;
	Mon, 29 Aug 2022 10:51:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3029FF8016C; Mon, 29 Aug 2022 10:51:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DCC1F800AA
 for <alsa-devel@alsa-project.org>; Mon, 29 Aug 2022 10:51:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DCC1F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="ZNbaKIsT"
X-UUID: bfb3a7a776864400adb586ecfc98533a-20220829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=U/AxJXnf+xQ1LjUqO0U6FEQIK7Tv7ZCYAUuZhJZg2Q8=; 
 b=ZNbaKIsTPr9tHKGvk5PpLws0e0BAr4gEX5+UT6XSXOETcDQyaOSdxiWKIjHiGxssmAsBtI6CWSV7Ceumi97Hv7hvVLP2z20+EWWKwJWgPuzPJZ6uPrAL8jRTcSyyau5LNl0a4N5z9fQWFgweg1L26nd+S9IkBmI/KznKbWihKCQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:76aa34cb-482d-4ce0-9f30-315d6f8acf45, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18, CLOUDID:0f096a20-1c20-48a5-82a0-25f9c331906d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: bfb3a7a776864400adb586ecfc98533a-20220829
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <chihhao.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1727530921; Mon, 29 Aug 2022 16:50:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 29 Aug 2022 16:50:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 29 Aug 2022 16:50:58 +0800
Message-ID: <dcd647b6b5833e08e3ac588685bcdd9f5c625bbb.camel@mediatek.com>
Subject: Re: missing sound on kernel-5.15
From: chihhao chen <chihhao.chen@mediatek.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Mon, 29 Aug 2022 16:50:58 +0800
In-Reply-To: <87r10zxyml.wl-tiwai@suse.de>
References: <87e6d6ae69d68dc588ac9acc8c0f24d6188375c3.camel@mediatek.com>
 <YwNvQaNNIKB8ELhR@geday>
 <120e52d94c00aab2cf1f3d611b06f03356e8229f.camel@mediatek.com>
 <87r10zxyml.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: alsa-devel@alsa-project.org
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

Hi Takashi,

Yes.

To issue SAMPLING_FREQ_CONTROL USB request two times is root cause of
this issue.

K5.15 new behavior
snd_usb_hw_params -> configure_endpoints() -> issue
SAMPLING_FREQ_CONTROL USB request

Thanks


On Mon, 2022-08-29 at 10:06 +0200, Takashi Iwai wrote:
> On Mon, 29 Aug 2022 09:56:42 +0200,
> chihhao chen wrote:
> > 
> > Hi Takashi,
> > 
> > Because of this problem, is it okay to remove configure_endpoints
> > function call in snd_usb_hw_params?
> > 
> > Then configure_endpoints would be called in snd_usb_pcm_prepare and
> > USB
> > control transfers become the same as which in kernel-5.10. There
> > will
> > be only one SAMPLING_FREQ_CONTROL request and no sound-missing
> > phenomenon.
> 
> Are you sure that removing the configure_endpoints() fixes the
> problem?
> 
> 
> Takashi
> 
> > 
> > Thanks
> > 
> > 
> > On Mon, 2022-08-22 at 08:57 -0300, Geraldo Nascimento wrote:
> > > On Mon, Aug 22, 2022 at 04:06:58PM +0800, chihhao chen wrote:
> > > > I am testing many headsets on Android platform with different
> > > > kernel
> > > > versions.
> > > > 
> > > > On kernel-5.10, calling sequence for playback is
> > > > 1. snd_usb_hw_params -> set highest sampling rate, no
> > > > SAMPLING_FREQ_CONTROL USB request sent in this stage
> > > > 2. snd_pcm_release
> > > > 3. snd_usb_hw_params -> set proper sampling rate, still no
> > > > SAMPLING_FREQ_CONTROL USB request 
> > > > 4. snd_usb_pcm_parepare -> in configure_endpoint
> > > > SAMPLING_FREQ_CONTROL
> > > > USB request was sent on USB bus
> > > > 
> > > > With the same calling sequence, a slightly behavior change on
> > > > kernel-
> > > > 5.15 is
> > > > 1. snd_usb_hw_params -> set highest sampling rate,
> > > > SAMPLING_FREQ_CONTROL USB request  was sent on USB bus
> > > > 2. snd_pcm_release
> > > > 3. snd_usb_hw_params -> set proper sampling rate,
> > > > SAMPLING_FREQ_CONTROL
> > > > USB request  was sent too
> > > > (because configure_endpoint was moved to snd_usb_hw_params
> > > > function)
> > > > 4. snd_usb_pcm_parepare -> no SAMPLING_FREQ_CONTROL USB
> > > > request  because of USB EP flag check
> > > > 
> > > > I checked all USB packets and confirmed audio data output was
> > > > correct.
> > > > But there may be missing sound problem for the first sound with
> > > > many
> > > > headsets (for example Samsung headset).
> > > > I found this issue is related to two-times sampling rate set
> > > > request.
> > > > (I tried to forcibly skip first USB request, everything became
> > > > okay.)
> > > > So do you guys know why configure_endpoint was moved to
> > > > snd_usb_hw_params?
> > > 
> > > Hi Chihhao,
> > > 
> > > the commit you're looking for is
> > > bf6313a0ff766925462e97b4e733d5952de02367
> > > ("ALSA: usb-audio: Refactor endpoint management")
> > > 
> > > Good luck,
> > > Geraldo Nascimento
> > > 
> > > > Or could you provide patch for this problem?
> > > > 
> > > > Many thanks
> > > > Chihhao
> > > > 

