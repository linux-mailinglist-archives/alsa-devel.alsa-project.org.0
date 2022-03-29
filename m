Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7D94EA49A
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 03:30:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A15F61750;
	Tue, 29 Mar 2022 03:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A15F61750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648517417;
	bh=QSh65hitVh14SSDucE/mStGkBm9yg4aHlu+2aFNestA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BhsYeWVMgSwM8UbwodIBRcBpETiof8lyi5EBUejKJCh5j+0/CIMOfQyG4EyQiVaxK
	 YrUCAsbhx4C6AupfPIKLWhtHLabUv0SmNHYdQyMegw2ZEdZmxnzFaDoLNpO3C/LJR5
	 hcPoMWNCAGBFAhZivNdRUluaTlwhPcixbyMufbi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D237F804B0;
	Tue, 29 Mar 2022 03:29:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A1E2F80311; Tue, 29 Mar 2022 03:29:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 840E9F80121
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 03:29:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 840E9F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gmqfmXDE"
Received: by mail-pf1-x435.google.com with SMTP id x31so7895834pfh.9
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 18:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8RWKOtmx36LC8yLEISKBczl/3PqgfL2wdJ+l1FkdZvo=;
 b=gmqfmXDEr/Jg/JcEXwQ/nAYvX4nu4pGb0MkhP8/V3+vHw2sDt3mmAouBJdogl3FHoN
 KINdxmZcZpu8iHiRrmgD7JkCVFSslmY1fD8C/gOFuvg6aR2YbomWdBaxjeXiAfG9cJaq
 2l5oL4+NHXleL7U3dNvCGRD+DEtiSq9M4FU463V6E8hxGwb6TSPUYIsxvDFe8EMpozOu
 FCBgyTLLIx7Rqf9ikuDLNAHXSbby7NTrM7OVXleuoNh0/4RwcmGBvETds2XNxSxkQeuv
 YlCCOexSVhM4KK0BQt+45333YxKPCzDi7uhR3YxypzjD/QUbt+o8jf26Xiq0vOKnPwa1
 752w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8RWKOtmx36LC8yLEISKBczl/3PqgfL2wdJ+l1FkdZvo=;
 b=sObsCf4gqR3/PUnvRIrZhVJaDk1S31+pVW30sB4FLWmYCZyN1nhOnJ0A3PFwReNC8M
 CyBH6rBdcPfRl/zijlq6T+Y6TgMMdASQwllbBxeW61DrznYXUJLRvrQjXzYS4+W6D474
 M6t+Nzp0elRJJ6kd3Rh/sZ9atng4UygYgCG/658vl54dbOZzs2y1rZsOpMOcbbXW01cy
 ikdS/oXTWAicp1Jb+JgpvxNdIYbDWL8Ed0YOWzT4jha7nOGpWPD09cMiY1UWbCT3Il8k
 vceV6JSWXevUtNXqqHti45r23j+icEZxuelpk/Ve42Rb6PNf8SeL3eo7YsW8UhPn2+U4
 Kncg==
X-Gm-Message-State: AOAM531of4g/0JzJHp2kGYoh1xv/NBw646Jijh+b66clubmDP0E6uOan
 s4DPOCadRDDXNRrCycKW+og=
X-Google-Smtp-Source: ABdhPJx3pXQp5CBClxzCKjbibsuK3ueJtHhSUlztbLQ0G6UdL+LbDrcIrkqV57I1BEtcrXg2kbUWbQ==
X-Received: by 2002:a05:6a00:14c6:b0:4fa:eae3:ffe4 with SMTP id
 w6-20020a056a0014c600b004faeae3ffe4mr24910871pfu.45.1648517337688; 
 Mon, 28 Mar 2022 18:28:57 -0700 (PDT)
Received: from localhost ([119.3.119.18]) by smtp.gmail.com with ESMTPSA id
 s10-20020a63a30a000000b003987eaef296sm348236pge.44.2022.03.28.18.28.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Mar 2022 18:28:57 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: broonie@kernel.org
Subject: Re: [PATCH] soc: soc-dapm: fix two incorrect uses of list iterator
Date: Tue, 29 Mar 2022 09:28:48 +0800
Message-Id: <20220329012848.9564-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YkHi98GDDWNie7GP@sirena.org.uk>
References: <YkHi98GDDWNie7GP@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, stable@vger.kernel.org,
 xiam0nd.tong@gmail.com
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

On Mon, 28 Mar 2022 17:31:51 +0100, Mark Brown wrote:
> On Sun, Mar 27, 2022 at 04:21:38PM +0800, Xiaomeng Tong wrote:
> 
> >  		case snd_soc_dapm_pre:
> > -			if (!w->event)
> > +			if (!w->event) {
> >  				list_for_each_entry_safe_continue(w, n, list,
> >  								  power_list);
> > +				break;
> > +			}
> 
> This doesn't make much sense.  The intent here seems to clearly be to
> continue; the loop but this doesn't do that - instead it appears that
> continue doesn't actually do the equivalent of a continue but rather
> skips over an entry.  This should instead be replaced with a plain
> continue statement.
> 

Yes, you are right. Sorry for a slip of the pen in commit message:
should be "to *continue* the outer list_for_each_entry_safe() loop"
not "to break ...".

I have resend a PATCH v2 for the fix as you suggested, and cc you.
Thank you.

> THe naming of _continue() needs fixing I think - it's just asking to be
> a bug.  Fortunately there's very few users.

--
Xiaomeng Tong
