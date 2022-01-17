Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F739491007
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 19:06:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04FE21911;
	Mon, 17 Jan 2022 19:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04FE21911
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642442807;
	bh=sr3C5cQceJjxjERCqWF3bWzmLe/ZuRmb0b5q/2wgs+o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sXpOkqK/WbSpB7yF2KXKpgQxneVxY1+k9Q5tbBr1t/bp0aAclUKjE2sJ+Z7UiUtRF
	 f4uVqQCTMhhcV7inhXScM0q5rB/CPPYCpblswU7G236hUsULFVBiDEReC/NAo3nvSb
	 sZ5b/xDTPtB4IBJxzGWo/c+xMEmpwMe6FovJLUB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70C61F8014B;
	Mon, 17 Jan 2022 19:05:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D435DF80249; Mon, 17 Jan 2022 19:05:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3187CF800EB
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 19:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3187CF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CF1ojwh8"
Received: by mail-lf1-x12d.google.com with SMTP id s30so60715734lfo.7
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 10:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=tdmQHxjn7EyX8OWtdiBRgoVEAM5RY1oLHJ9+0zFtQPM=;
 b=CF1ojwh86pK3M82SUEWHol8uvjleEFASvHZtUVzoKx3L9dYcvrjd8M9j3ZNd5f/yOq
 QBV1qv5abr8wkixYbt/Gopehe0ulXSbEPA5EFRDC2EOAs7wZiR5kQI2V1QDp5dFoRnkd
 KioKmotveQHYVhyLPoFT6BkkpFA9epL9CIio/f3dgSRugwn6e5u3WYpwuKH0nxajHjU2
 cGdtSI6CzivT7DLiKTrh2xy83QmOOyYFFw6SwOIvzTxd57HWAx99P6BD1+g+OVbtS83+
 5uEeKAyfoRV7qgLWRTAJSl7S4/CvY2gQsMq5IGNYp09hAvMTinacmLoUYxh1RPVxomsR
 y1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=tdmQHxjn7EyX8OWtdiBRgoVEAM5RY1oLHJ9+0zFtQPM=;
 b=xYBoQ9xFJ27p+SgDRLFrTBejncwsMrVAVBuXhiUrlnEyUouBitaEOfo9qCLGq8DcYL
 Y/6F505IuTWnVLyoZ4G7UCiBfVV2QTwjZiYILnS1UnmLWnOqckvz7YEVtwicQKzka/kT
 Stt1kdo2oBdqfzp+XG1FLTICXGKgMbPzdidIwHoI7PljYhGvXoRJQvTBpMa9/LDV5uRK
 mOrftZ+ST6IsBLDkHdrhsX0zVMXNqxkN2HVty4eZuJEX1VM9sh2hcloANnwKYbJIEcfU
 fdmAhBIEydjF5r4EH0Z80RkZpCRWc+M3D7aLkyAM97FLdcJcEja8q8eVNeQm6KfcaQ3V
 iB8Q==
X-Gm-Message-State: AOAM532orbEgKoFoNsUcxRz2nKU226rmIR4cG49v0CpEEdXThwoibxoZ
 HUcrdRtbVX5uOtNiYpA9rDm8ezHr6kDb6w==
X-Google-Smtp-Source: ABdhPJzBduXLtqcJVcc9jMhwGadAFDTIf+f7CQ2dkKbhLRLre8sT+112gzGJCky/2UC6QMrjr/5BkA==
X-Received: by 2002:a05:651c:1549:: with SMTP id
 y9mr14480440ljp.94.1642442730095; 
 Mon, 17 Jan 2022 10:05:30 -0800 (PST)
Received: from localhost.localdomain (ntd06459.static.corbina.ru.
 [95.31.14.149])
 by smtp.gmail.com with ESMTPSA id s18sm1041196lfs.23.2022.01.17.10.05.29
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Mon, 17 Jan 2022 10:05:29 -0800 (PST)
Date: Mon, 17 Jan 2022 21:11:12 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v2 1/1] ALSA: hda/realtek: fix speakers and micmute on HP
 855 G8
Message-ID: <20220117181112.bmbjcofdjjpsfgzo@localhost.localdomain>
User-Agent: mtt
References: <20220114164904.lgj7yimbei6fmloe@localhost.localdomain>
 <20220114165050.ouw2nknuspclynro@localhost.localdomain>
 <CAAd53p6KXD2mEHgkU_TpTrsU-vQ9Vxdip+6sPfDaVoSOkmaz-g@mail.gmail.com>
 <20220115163208.xmvum6ehqcadonj7@localhost.localdomain>
 <CAAd53p64w38NCo7c0cnKCyjaswa0_Rns-CjWBwOnph3V5J2taQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd53p64w38NCo7c0cnKCyjaswa0_Rns-CjWBwOnph3V5J2taQ@mail.gmail.com>
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, linux-kernel@vger.kernel.org,
 Elia Devito <eliadevito@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Werner Sembach <wse@tuxedocomputers.com>, Hui Wang <hui.wang@canonical.com>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>
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

On Mon, Jan 17, 2022 at 08:12:08AM +0800, Kai-Heng Feng wrote:
> If this issue also happens to cold boot it seems to be a BIOS issue.

I've discussed the problem in more detail [1] before sending the patch. 
In short, speakers seems to reliably work in live Ubuntu which differs in 
using initrd with modules vs UEFI stub with built-in drivers in my case 
(I've tried Ubuntu kernel sources). I've tried using modules as well 
(modprobe'ing the list of modules which are load by Ubuntu) with no 
success.

It was suggested that there is a timing issue somewhere. I'm opened for 
ideas to try to debug the problem origins further (to avoid the need in 
the fixup).

> > > If the issue only happen to warm boot, please try reverting commit
> > > 9d3fcb28f9b9 "Revert "PM: ACPI: reboot: Use S5 for reboot"".
> > > Many HP systems requires it to have a functional reboot.
>
> If possible, please still give that commit a try.

Well, the first cold boot (with this commit reverted) didn't have any 
sound, the same goes for the subsequent reboot.

[1] https://lkml.org/lkml/2022/1/12/221
