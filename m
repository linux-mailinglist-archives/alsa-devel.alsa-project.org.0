Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BBE308B5B
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 18:26:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39CF71698;
	Fri, 29 Jan 2021 18:25:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39CF71698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611941168;
	bh=IZ8Su8374x8/2Bt9F0RArPF4ZIV6JsUyPnB4MY0n0vo=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WbGff6dmFZYh0s7Ozr8fkxqB33lEFvYgZrxBGs4KZZubvlRdHdGsyQkvsn4Kgl+Hx
	 GE02PKbMTvFISkNSsC/ASnUGz/k6LCwrtIlZtTlPbBZeLasQm2AuE5l+1a1cIlQr0I
	 KrjfYbWbIvxrCvYmAZ4G/4z60QSC6Nf8uFyrmhGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AF28F8025F;
	Fri, 29 Jan 2021 18:24:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6900F80259; Fri, 29 Jan 2021 18:24:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94CB3F800E9
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 18:24:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94CB3F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="bv1dP1r6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611941065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1tJEDpVaTU2o7pEzEYi/Itw24bwaC7NiGn/22B7qnc4=;
 b=bv1dP1r6yRx8HvpRiBl5i+lknLWT7YZ1pHsDaSX7hU6Sew/ngFeRVFgKyd1lkPvJP1L9Pm
 DZ4vNSGWWozd1bGBGAvyEiPoGJo8CMSNwBkttKFJTBU58yzJgEZQ6b+owyryzUIK673q+U
 cHIQGrL1kG/oyAz4Pt2X63HjFwofiO0=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-U8uWu3LGO7qLo_4nz_GDnw-1; Fri, 29 Jan 2021 12:24:24 -0500
X-MC-Unique: U8uWu3LGO7qLo_4nz_GDnw-1
Received: by mail-il1-f197.google.com with SMTP id q11so1635743ild.22
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 09:24:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
 :references:mime-version;
 bh=1tJEDpVaTU2o7pEzEYi/Itw24bwaC7NiGn/22B7qnc4=;
 b=YQy3n1b1pnXS+elZ25tQlublJWEDF1KnDjyZq87QWKuOmTkE6UhDHaozmug675Ieqp
 KGgChzfU1AgAbfzzeDQSYf1sQ8HCwbRqoDIbHCjb/fGEJQoNhL5aXp9SBqIsSZBBgd/8
 DA8iVUNFMlKlnYmbr1MHv8RR0bbuS90rSiDSf+eCcgl474Sao9SHhhniDL53YxSQNW3R
 f7D6Fi2VldaJxSMsj+ENHUgtzBb7a2FldwJ+6a1D6/kEl1hPg5hnLTe+uoHOEM1vbTLG
 pv8SfU2wXenUePwtsy/Qp5Fp+r/vJtdogt1/QdHNOdSaMuj0g9VgEsqyECLhBWxxGEf+
 HSzg==
X-Gm-Message-State: AOAM5325QZHC2mPTiEzX4D2U6MhHJ5AXBYZAcE/gt43I6Kld8rE1cYe6
 N32miOxH5SjOwEhfEfCUtHsBxHL57Uo8kFMSrWHMK451sRNwKtwx8vLxpXO4mhTAIstWrtF7Vy3
 0YvXM/vTaK+nmitYKZn22+IE=
X-Received: by 2002:a05:6638:229b:: with SMTP id
 y27mr4572017jas.136.1611941063712; 
 Fri, 29 Jan 2021 09:24:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBQCa/aQwAwI0WBJb/kQp4EcDUYeQ7uixWQ+zr7FFHIFR0qu+Poa5+gr/i329TB8Xg1vOo1g==
X-Received: by 2002:a05:6638:229b:: with SMTP id
 y27mr4571989jas.136.1611941063408; 
 Fri, 29 Jan 2021 09:24:23 -0800 (PST)
Received: from chargestone-cave ([2607:9000:0:57::8e])
 by smtp.gmail.com with ESMTPSA id b16sm4761308ile.32.2021.01.29.09.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 09:24:22 -0800 (PST)
Date: Fri, 29 Jan 2021 11:24:16 -0600
From: Michael Catanzaro <mcatanzaro@redhat.com>
Subject: Re: [REGRESSION] "ALSA: HDA: Early Forbid of runtime PM" broke
 =?UTF-8?Q?my=0D=0A?= laptop's internal audio
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <GOHPNQ.RTPVHYRR9NQ62@redhat.com>
In-Reply-To: <s5hft2jlnt4.wl-tiwai@suse.de>
References: <EM1ONQ.OL5CFJTBEBBW@redhat.com>
 <BY5PR11MB430713319F12454CF71A1E73FDB99@BY5PR11MB4307.namprd11.prod.outlook.com>
 <U3BPNQ.P8Q6LYEGXHB5@redhat.com> <s5hsg6jlr4q.wl-tiwai@suse.de>
 <9ACPNQ.AF32G3OJNPHA3@redhat.com> <IECPNQ.0TZXZXWOZX8L2@redhat.com>
 <8CEPNQ.GAG87LR8RI871@redhat.com> <s5hft2jlnt4.wl-tiwai@suse.de>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcatanzaro@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: alsa-devel@alsa-project.org, "N, Harshapriya" <harshapriya.n@intel.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, kai.vehmanen@intel.com
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

On Fri, Jan 29, 2021 at 5:17 pm, Takashi Iwai <tiwai@suse.de> wrote:
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2217,8 +2217,6 @@ static const struct snd_pci_quirk 
> power_save_denylist[] = {
>  	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
>  	SND_PCI_QUIRK(0x1043, 0x8733, "Asus Prime X370-Pro", 0),
>  	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
> -	SND_PCI_QUIRK(0x1558, 0x6504, "Clevo W65_67SB", 0),
> -	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
>  	SND_PCI_QUIRK(0x1028, 0x0497, "Dell Precision T3600", 0),
>  	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
>  	/* Note the P55A-UD3 and Z87-D3HP share the subsys id for the HDA 
> dev */

Hi,

This patch works fine on my laptop. I have no clue whether that means 
it's really safe to remove the quirk. I've never noticed any clicking 
noise myself, but I understand it has been a problem for other System76 
laptops.

Michael


