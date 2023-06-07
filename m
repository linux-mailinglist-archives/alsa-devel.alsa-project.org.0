Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E425729D46
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:49:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 110A683B;
	Fri,  9 Jun 2023 16:48:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 110A683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322177;
	bh=S4N84Q/XuKxvguEVlL08Ccbl7qNQPElJBwjg19W/h3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EBy2poxQFCFpJ5LqDRM0aOD7+X+QDXtICkrqclGTFGJ2BvYEDNVyp80tg45Et0TLK
	 uO6cuMQRvUHLwmPnqbvEw2lOqjB+sNhIcLFlDTvNzzuGRThy4ZuNSoVPRctEGZjiMN
	 hTKZ6V7RXGBLNCb+vl7P6VTgGMvTyKFh7zwtWPbQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2488F805AF; Fri,  9 Jun 2023 16:47:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDDCBF805A9;
	Fri,  9 Jun 2023 16:47:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6027F80199; Wed,  7 Jun 2023 11:27:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AEFDEF80130
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 11:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEFDEF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=adEfMG23
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 73C8A6397D
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 09:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D780EC433A7
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 09:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686130052;
	bh=S4N84Q/XuKxvguEVlL08Ccbl7qNQPElJBwjg19W/h3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=adEfMG23wrbttlBY8g+O1YEFORwxmCylWY/KOJ5LYA+9BJzF4cc3TtZ/j+Lq6AlE5
	 LNFckixjpFdZAiNVDNfgeff+qH4cYNrMhaNq3PcxRf85AWwQNYTeNL196hLMLp0uFZ
	 o5dT3zdhuESLVyJ6YA+OfX9IJLT9zMKD8qEq3fwV+QqOOpzXA2XU/cKIG3jWW6jJDv
	 l8wG0I5S8q+ZD3hg5eBcFHrFPOcgHV7P3VgC1oNC+UkuZuqwuYAHIMHp0c4IQJpw3+
	 nzncCcwfLIlHVt1KkYU2NUSqkOf6vNxSRFsk0mcinlWYp40cWXZV20qTvnxbFD/5JM
	 6i/cu/s6ssRNw==
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-9741caaf9d4so1052218866b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Jun 2023 02:27:32 -0700 (PDT)
X-Gm-Message-State: AC+VfDyEh3LEp/NViZH+YwCvFZV9wkFYUcmn4Wa8oPvzIBqsIp1pbnuq
	lcrqJAKQqm4RTtdZX7zqlLHICltCvCut4Laxbyw=
X-Google-Smtp-Source: 
 ACHHUZ6Bjf1fTZHehrmL/0J7KIp5KJgCHQLXcP99ZoQHK0JdBwWTlD0SrnO3Wkcd3zEsyblyQohw5HIAdV+g29Gixe4=
X-Received: by 2002:a17:907:1c9e:b0:974:20bd:6e15 with SMTP id
 nb30-20020a1709071c9e00b0097420bd6e15mr6406408ejc.4.1686130051016; Wed, 07
 Jun 2023 02:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686128807.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1686128807.git.siyanteng@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 7 Jun 2023 17:27:19 +0800
X-Gmail-Original-Message-ID: 
 <CAAhV-H4imFk2tmz+kCRBEiD+ka08nKKhvhepWFhovhVNnoA49g@mail.gmail.com>
Message-ID: 
 <CAAhV-H4imFk2tmz+kCRBEiD+ka08nKKhvhepWFhovhVNnoA49g@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 0/4] Add Loongson HD Audio support
To: Yanteng Si <siyanteng@loongson.cn>
Cc: tiwai@suse.com, perex@perex.cz, chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: chenhuacai@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BKRNOOF5OFRATXE2VKM5NVG43NIBPGQC
X-Message-ID-Hash: BKRNOOF5OFRATXE2VKM5NVG43NIBPGQC
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:46:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BKRNOOF5OFRATXE2VKM5NVG43NIBPGQC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Acked-by: Huacai Chen <chenhuacai@loongson.cn>

On Wed, Jun 7, 2023 at 5:22=E2=80=AFPM Yanteng Si <siyanteng@loongson.cn> w=
rote:
>
> v3:
> * Adding some comments.
> * Seting polling_mode flag.
>
> v2:
> * Handling with two new flags added to struct hdac_bus.
>
> v1:
> * The Loongson HDA controller is compatible with High Definition Audio
>   Specification Revision 1.0a.
>   See <https://loongson.github.io/LoongArch-Documentation/Loongson-
>   7A1000-usermanual-EN.html#hda-controller>
>
> Yanteng Si (4):
>   ALSA: hda: Add Loongson LS7A HD-Audio support
>   ALSA: hda: Using polling mode for loongson controller by default
>   ALSA: hda: Workaround for SDnCTL register on loongson
>   ALSA: hda/intel: Workaround for WALLCLK register for loongson
>     controller
>
>  include/linux/pci_ids.h     |  3 +++
>  include/sound/hdaudio.h     |  2 ++
>  sound/hda/hdac_controller.c |  5 ++++-
>  sound/hda/hdac_device.c     |  1 +
>  sound/hda/hdac_stream.c     |  6 +++++-
>  sound/pci/hda/hda_intel.c   | 20 ++++++++++++++++++++
>  sound/pci/hda/patch_hdmi.c  |  1 +
>  7 files changed, 36 insertions(+), 2 deletions(-)
>
> --
> 2.31.4
>
>
