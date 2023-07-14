Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8879B752E78
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 03:12:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A16C7A4A;
	Fri, 14 Jul 2023 03:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A16C7A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689297144;
	bh=vVZF0lyzCXqHpUsnSyYlva0CCdL7KSzBN7isdIit9dE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g02pcqVUlFVhGHLHd7jBWfXWVdfJo8y7ZnwGbc/V/gDZeOnGrF2t+416r22cF16h5
	 kLSZ/cQeGEdK9gC39L5sFD0eIB5rBCN/BRUuKaG7KojXWeLQOexHTzAEJraKjXcIzq
	 TVB7gpCi8NKzYTQ50rVTONAZcs70mwiNOaa+FamQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D2E7F80236; Fri, 14 Jul 2023 03:11:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3AD7F80236;
	Fri, 14 Jul 2023 03:11:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8018DF80249; Fri, 14 Jul 2023 03:11:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C914F800D2
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 03:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C914F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=JT+9h/Vp
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-558a79941c6so939460eaf.3
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jul 2023 18:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689297078; x=1691889078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVZF0lyzCXqHpUsnSyYlva0CCdL7KSzBN7isdIit9dE=;
        b=JT+9h/Vphc82wfdrbnF8/7FTOGAFa9AGaOXCM8HDgCj/YDmbujF4w6IdTLj1EhVal3
         2J4fr57FZ/thIVxQRKAShbwC1vym5rcorHTIAKV18027IKUBEyIs/eU0EQ1drxMwRV/v
         YYpVcp1cqmStSvgbMs0CyNwEEjPRoLoq3+NAMPPoKoi88eNJ4uHQPUitwFHFUPr2zR9T
         Suto8IJrpL3lR57o7dXOGauWQsmyUvK93d7+2TFPvbnyBAZuc7OhZ5zHpZmOFlixlaLo
         DSXJqspIh5DCVv0GwYuN6ZsmMdAJelXC+3aRfp/LguqY+8T+Q5BM3dkrjWVgYGrcMLWO
         UTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689297078; x=1691889078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVZF0lyzCXqHpUsnSyYlva0CCdL7KSzBN7isdIit9dE=;
        b=lkPWd/dLKEykM6Rg9HdfuoW4LW0rMOgaUWnpBlrYnFB5M/irI22VbPfwR76tn1hPY3
         KlIfEneSVUxt5c7ygJOpr5UfaDkT5rIoSvARShdU+1RnTA9pFJEqafL5utI/DhLZERfw
         78oekjJ222rKhMFZyDJou3LtydWMN75BWv4ZWGUaTFPB9rjWa4B28yZzDk2wlE0pEUqW
         dSLWIOvfV9qN8/rntJartbjCXTG2JXrkiaBP/N+8kJ93qXsVRbymbi2pmDvkWyBXRyvo
         1qItcsgvHIWgBbcnwE8cQSv9L6oqzLfGUG5rEP4LYhq5ATtOOSdrrKKQVUW3S4yH7Sbi
         ORjQ==
X-Gm-Message-State: ABy/qLbjDOBhULNkck7LYvMJZcoUnkjXzeLf5hWhAMJMl33ATZNAI5Ds
	4BozSYJ4HWASXzksc18d7n8HIdfDJWR3EWxJOAc=
X-Google-Smtp-Source: 
 APBJJlHCeMPvax2/IM2CPaptdMCJKdeNhQXTNEzeRrQkOyaLpYqEqfq/zelFt/qAGlHFghK/RIAxLFS2p1gAG9NdYig=
X-Received: by 2002:a4a:3450:0:b0:566:f5bb:7d40 with SMTP id
 n16-20020a4a3450000000b00566f5bb7d40mr2919868oof.6.1689297077806; Thu, 13 Jul
 2023 18:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <bug-217440-225600@https.bugzilla.kernel.org/>
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
 <ZGB0cVVI7OgaJU6t@debian.me>
 <CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
 <87cz338ix4.wl-tiwai@suse.de>
 <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
 <874jodlnmi.wl-tiwai@suse.de> <415d4bc84aa74c74af913048f28b42a9@realtek.com>
 <87fs7mdofi.wl-tiwai@suse.de> <7da2fdfdae614b1c98deda6e11ca34eb@realtek.com>
 <87353kd8b9.wl-tiwai@suse.de> <1170325957764b4cbd7cd3639575f285@realtek.com>
 <CABpewhGBakDSBLKZ1cr2=OMspuu3qyYwZrsXUggQ3vt8gsD88A@mail.gmail.com>
 <873536js7q.wl-tiwai@suse.de>
 <CABpewhE0NAC-Q=iqG2Ba=XhT7SXsWy18wQGYUaopzmKDfFxyPw@mail.gmail.com>
 <2c1fcbc00bb44d66a29ac1c1e4bec5ad@realtek.com>
 <CABpewhFthKG97dPiQC4JhGx9sapX9Yu5rWABQjpY95TSA+eawA@mail.gmail.com>
 <485f99149508488080d563144454040e@realtek.com>
 <CABpewhGkvWtM+9J=mx3vw0QY=OBB5OYCxzX3nzVffvFS4QazPA@mail.gmail.com>
 <2831c55638a5431ca9e37d9caf365ed2@realtek.com>
 <CABpewhGiMJUpyBA6=D9_-YA6=5rjR2R0RHUZeg+cWcjtzuCoZQ@mail.gmail.com>
 <3c27f0455d6e4bd1a68115bd25bf1a12@realtek.com>
 <CABpewhEptq0+W_71U__8iQ4+LNtYSUB9C+0bcS2Hw-5mnj9viQ@mail.gmail.com>
 <009474f04d0b45c69a0e42e8622b7a86@realtek.com> <87h6rhcef2.wl-tiwai@suse.de>
 <0990300d759846d890de9c92fcad9a9d@realtek.com>
 <CABpewhERnOH1qkkJ5_JJUZkz1_8oxD9aR5VBs1vsURAG7Eu_Ew@mail.gmail.com>
 <878rctcavz.wl-tiwai@suse.de> <874jnhc9u4.wl-tiwai@suse.de>
 <CABpewhHG2+s8_6r6vChm2g5tD8ALW_SWJWubPRXWzTJB2aFR9g@mail.gmail.com>
 <875y7vbxpg.wl-tiwai@suse.de>
 <CABpewhHDnvn4v+uCpsaLHB+biw-f59tdTiCyFkicHnewXHYDNg@mail.gmail.com>
 <87wn0aa1s4.wl-tiwai@suse.de>
 <CABpewhFg=7+JR6v=zhi0_Hm9+S64DLOHKeG2pS-W7z-vNpu_5Q@mail.gmail.com>
 <87leg7x4h7.wl-tiwai@suse.de> <f4969213b5a14cc5a11befb4df861481@realtek.com>
 <87cz182hfk.wl-tiwai@suse.de> <4678992299664babac4403d9978e7ba7@realtek.com>
In-Reply-To: <4678992299664babac4403d9978e7ba7@realtek.com>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Thu, 13 Jul 2023 21:11:00 -0400
Message-ID: 
 <CABpewhGkw2rg_NN7Rd8E_p+AN9MC0A1CjgnrhBvMnSKq0gz31w@mail.gmail.com>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: Kailang <kailang@realtek.com>
Cc: Takashi Iwai <tiwai@suse.de>, Bagas Sanjaya <bagasdotme@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: I4KVWEVZDNGKGVBWHIWJ2L5UWBI6A2XZ
X-Message-ID-Hash: I4KVWEVZDNGKGVBWHIWJ2L5UWBI6A2XZ
X-MailFrom: josephcsible@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I4KVWEVZDNGKGVBWHIWJ2L5UWBI6A2XZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 13, 2023 at 4:25=E2=80=AFAM Kailang <kailang@realtek.com> wrote=
:
>
> Hi Joseph,
>
> Could you test attach patch?
>
> BR,
> Kailang

I applied that patch on top of kernel 6.4.3 and tested it, and yes, it
does fix the problem.

Thanks,

Joseph C. Sible
