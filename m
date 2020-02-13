Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B32C015B6EF
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 02:59:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3CF91673;
	Thu, 13 Feb 2020 02:58:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3CF91673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581559153;
	bh=YAvfugY2AG177mYz6Uto+lzriqR8uqRhLszTZnqJSVA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k8RneU9pJhTkoQfEK1FbtLSakKCWX6TrjOIYRpca+sNB/7V60fqCVJCbW55BGuQ79
	 8p+KHrixTr9dbJ/xAkuil0xc8u05HUpDnvFyFeOWe9tm3cvSArfwRA4ghH0cL9R1Mh
	 ku4SuMNLVL6l5xl6NZoRxPkl+MqSKwXWkfY/yK44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04E55F80158;
	Thu, 13 Feb 2020 02:57:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CFE7F80157; Thu, 13 Feb 2020 02:57:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id E0645F80125
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 02:57:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0645F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="hne3FsPD"
X-UUID: dc98b481c0ca478ba22111a988250ed4-20200213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SS2WJ9TnlTdWxgp0Ian/hWdeQ6K5JRe2gnRD2HiUUuo=; 
 b=hne3FsPDQO9jeuZ9Tnc+sCBIQjIKoA+2MLp1XYmlv2S9RNIOUMa9d/wgECzF/Aq9pE7mQo7seqIPGY+ZET3B3W3TQm4nQkv93k2TkB6sDKUcFx3BpoN7MKiGX7bdzCDK7aSH0SR6KCRt2M57suGHRfmxkEnuOppdWwgt4l32BR4=;
X-UUID: dc98b481c0ca478ba22111a988250ed4-20200213
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2053184014; Thu, 13 Feb 2020 09:57:15 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 09:55:50 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Feb 2020 09:57:18 +0800
Message-ID: <1581559033.14792.9.camel@mtksdaap41>
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 13 Feb 2020 09:57:13 +0800
In-Reply-To: <CA+Px+wXjC1rchzUGhYYCJVyEbm7RQNFnqf-sQNaky6d82DyLyw@mail.gmail.com>
References: <20200206031752.193298-1-tzungbi@google.com>
 <20200206102509.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
 <1581495554.22603.2.camel@mtksdaap41>
 <CA+Px+wXjC1rchzUGhYYCJVyEbm7RQNFnqf-sQNaky6d82DyLyw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 242DD775477EA9B69ECE3E92EE470D936050FE8CEE227D1CA21D57919E72DCD62000:8
X-MTK: N
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, p.zabel@pengutronix.de, Dylan
 Reid <dgreid@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v2 2/3] drm/mediatek: support HDMI jack
	status reporting
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi, Tzung-Bi:

On Wed, 2020-02-12 at 19:31 +0800, Tzung-Bi Shih wrote:
> On Wed, Feb 12, 2020 at 4:19 PM CK Hu <ck.hu@mediatek.com> wrote:
> > I think hdmi_conn_detect() and mtk_hdmi_audio_hook_plugged_cb() would be
> > called in different thread. So it's necessary to use a mutex to protect
> > this.
> 
> Thanks for the reminder.  I feel using mutex here is overkill.  Please
> see https://patchwork.kernel.org/patch/11378413/ for my proposed
> solution.
> 

I'm not only consider the race condition of plugged_cb and codec_dev. I
also care about the atomic of mtk_cec_hpd_high() and hdmi->plugged_cb().
If these two function is not an atomic operation, below is an example of
problem:

<Status disconnected>
1. Thread A call mtk_hdmi_audio_hook_plugged_cb()
2. Thread A call mtk_cec_hpd_high() and get disconnected.
<Status connected>
3. Thread B call hdmi_conn_detect()
4. Thread B call mtk_cec_hpd_high() and get connected
5. Thread B callback plugged_cb() with connected
6. Thread A callback plugged_cb() with disconnected (Bug here)

Regards,
CK

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
