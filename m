Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E04682BB5B4
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 20:44:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73E3F16E3;
	Fri, 20 Nov 2020 20:43:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73E3F16E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605901470;
	bh=uCO9cgLnyV30P9y9N2Itw+Qfqs1GAK1IRnreHimkn18=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OcqT0PwdW1kwJugmYrbxMO1rvf02bNidlnjwZkR58pb+aW36CNnk+Md9IsBl8IwB+
	 UPmgi8vpfbmIJPUogogGj6dn7TPwvZTCRURqC9V1W8kyDAM2O1Zh/2kVTCTwcHM9vw
	 UFVchVJ4hjD9UR+jUzSKe/Ekqh3cZRDbcFG6ZQyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E65A0F800C5;
	Fri, 20 Nov 2020 20:42:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0BDBF8016C; Fri, 20 Nov 2020 20:42:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB511F800C5
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 20:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB511F800C5
Received: by mail-ed1-f66.google.com with SMTP id a15so10740180edy.1
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 11:42:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jOXZ/NCVCIvYKIWpmcFp+SbynGH7tAa1IfD+gFImPbE=;
 b=KEOOFwvze6Za9EZvu8CKGqxRd0UO/n17NDzMbdplCe6/NXU2K1PSOqGp7yyhQ/gHiA
 HYleoYBc45s7nWyNeuGwAepiusFKmRbJwzgdOQPfcCKxBMvuJypU++vuXMYKFhzG/618
 Y52XFiMGO1SnXsl59TSwGvttZvjuKhtgfwdGdZLWw/ZNd+JUSsTBk9/EEHFW3XXP8PRQ
 zHygPYguOsdM/UpFI2Z23J97bH36v133LDK/pmAyb/JYLgpRf2c6S3fTK9rqc4PS3hw7
 pCeGsiwEtseqkTFfmDoBEsqnyphjQKE2irxz2Q4Ifs6nYyLu7kUpRZtcGrrqezcMErxo
 xgmg==
X-Gm-Message-State: AOAM531c31aKVKI/sQLwqdXz/H41gHZkhw6VYk/wQaC9QSYNjGyxhJJy
 2WY2X2Xkb+41U0oiL8qwia22/7pDks9TLw==
X-Google-Smtp-Source: ABdhPJz8vRJ4tmub7T+MlTQoYvIJ7sDYDo7OFVZA0mTWzf4Z26ouD98jDYhqeqIh8GIHyhvgky2LXg==
X-Received: by 2002:a50:ab06:: with SMTP id s6mr29303017edc.288.1605901368051; 
 Fri, 20 Nov 2020 11:42:48 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id u8sm1514624edr.2.2020.11.20.11.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 11:42:46 -0800 (PST)
Date: Fri, 20 Nov 2020 20:42:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 01/38] ASoC: ak5558: drop of_match_ptr from of_device_id
 table
Message-ID: <20201120194245.GA2925@kozik-lap>
References: <20201120161653.445521-1-krzk@kernel.org>
 <20201120165202.GG6751@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201120165202.GG6751@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>
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

On Fri, Nov 20, 2020 at 04:56:34PM +0000, Mark Brown wrote:
> On Fri, Nov 20, 2020 at 05:16:15PM +0100, Krzysztof Kozlowski wrote:
> > The driver can match only via the DT table so the table should be always
> > used and the of_match_ptr does not have any sense (this also allows ACPI
> > matching via PRP0001, even though it is not relevant here).  This fixes
> > compile warning (!CONFIG_OF on x86_64):
> 
> It would be better to fix these by annotating the table as potentially
> unused, if nothing else it means if someone wants to add ACPI support
> (or it just works on their ACPI system with the plain old I2C ID) then
> they don't need to revert this change.

The point is after this patch - removal of of_match_ptr() - they will
already support the ACPI matching through the PRP0001.

Keeping of_match_ptr() and maybe_unused will prevent any ACPI re-usage
unless explicit ACPI table is added

Best regards,
Krzysztof
