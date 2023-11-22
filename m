Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7077F4374
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 11:17:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D791EC;
	Wed, 22 Nov 2023 11:17:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D791EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700648253;
	bh=SfMfIn6cGJ/3tiv0g8Ia2y4dY1dc2SCJf6LIUSGgQJU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DGQmARmBu3le2ygBnJ0TGuqiMPCyUIoSKFivUuhjO6pYEkWG88gTAg80mTlHulcyR
	 Mmx/pe5N3X57aXIxuitXLhEdRbNuQpjssfeCB//2KiwMWqFwrazJqzjGunIguwhBEJ
	 mGLs+2AzYxzfaUp0Q01XCIZxDSZeG4OvXD5ZgVT4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47BF6F80558; Wed, 22 Nov 2023 11:17:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B18BF80579;
	Wed, 22 Nov 2023 11:17:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42AE3F802E8; Wed, 22 Nov 2023 11:16:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3868BF80246
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 11:16:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3868BF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Z9y1a8SN
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-543c3756521so8993383a12.2
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Nov 2023 02:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700648207; x=1701253007;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rLc9eoJnMu6ltPbT1jIbts/TAhvqm1awxCFreB1Q6k=;
        b=Z9y1a8SNRyitbB07/HL+scubEosiQGmEQKCfLurfNoiU5za7Z7V5FuBMEA7+NJ6J/2
         rNYfgFHl46fTVd2zsqSvLja/EkmMiyBQNAEoIvl/WCApiqVnigZK0Bbh3heb4uJqAuHZ
         IEPt2rtLJo5A3ypaDddbm5HUMamqbxapqqCaMn8D9eTKdg3Ka+QbuYIiXMrzJzF5/bje
         63IHshpKIaEQCcQv6xN9hXR1kWNoM/knwEaDXT+XIU1Ep55P53j8jsnI3xrY3xKeOguo
         fU4SLH7s/jzCXFDYCdK//8TNmpGT2w4EX5sqlmHVS6RzAWb/nmjC3gAxDIpZDmhZMenJ
         S7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700648207; x=1701253007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rLc9eoJnMu6ltPbT1jIbts/TAhvqm1awxCFreB1Q6k=;
        b=qLMiTWMpPC7Yn2g2ccZde9Ng6cGAlqUbe5ECnEdACSVmztaDXXT+g/K0qWOw3YUaKR
         9ZlYrkmaXHcjsIuvWrDzdAty+QaOLnZaSralSJ+PmG+wYv2blwCdkMTSyrrfTFCLKkYm
         3orBXVFbxQq5+BxnV/Uj4xBqKRs9kTJJK5hGLmoktwEpYEeOn1arK3xQuRKbLUY9SCG6
         5rIkWkjsH8R0Pa9jNj4IUjl1CTs9DrFParnMlzldNrpUlg77XGUsvSW0HeylY1nAGHmh
         9crRk0CtMtZNjWo0Xwvy5HzqR+CNqMHt4IiPe/hp6kR7jTtmvHowrbqybof2ebCVi1Wf
         yD3w==
X-Gm-Message-State: AOJu0YwHwuMNfC4+d3aduSuV/GKhD9utfdZhTKO+K4gGKstTOzBKP34r
	qVBhhmxhihtIhLSrZrICuhi4Q9hMDyZOQOIC64A=
X-Google-Smtp-Source: 
 AGHT+IH/nwieVeaKbZx03znmMuIeYwKqQartp3JyCE9X3wGV4XSH5V/OVoP2++RCu/gWdT9pwIyQQOxwFkTbOpIvhy0=
X-Received: by 2002:a17:907:9543:b0:a00:4d7e:4825 with SMTP id
 ex3-20020a170907954300b00a004d7e4825mr966199ejc.35.1700648206932; Wed, 22 Nov
 2023 02:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20231117163900.766996-1-daniel.baluta@oss.nxp.com>
 <874jhh2g8s.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZBb0ZJk7aTaji-xH2jEs7QiTaoXTuS5_K-ruSaxpEnWdw@mail.gmail.com>
 <TYCPR01MB109142FEC8F77CFFE3930456CD4B4A@TYCPR01MB10914.jpnprd01.prod.outlook.com>
 <CAEnQRZD8zbgRzBrx+iHTbDqG5tOedNLyJByNNtSHTRtxFsgyGw@mail.gmail.com>
 <878r6qh2y1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878r6qh2y1.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 22 Nov 2023 12:16:34 +0200
Message-ID: 
 <CAEnQRZAVM6=2udYg0jY8dD_uVE8yGQgsoZ14K1MBiCP+dCqLNQ@mail.gmail.com>
Subject: Re: [RFC PATCH] ASoC: simple-card: Use dai_id from node description
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iuliana.prodan@nxp.com" <iuliana.prodan@nxp.com>,
 "shengjiu.wang@nxp.com" <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KB5NV4YUZ2QX7WAAESN42WSQAHFCRBIX
X-Message-ID-Hash: KB5NV4YUZ2QX7WAAESN42WSQAHFCRBIX
X-MailFrom: daniel.baluta@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KB5NV4YUZ2QX7WAAESN42WSQAHFCRBIX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 22, 2023 at 5:39=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Daniel
>
> > > But hmm... in your case, you need to setup 2ports, and use 2nd port
> > > is assumed approach.
> > > Why you don't setup full port ? Do you have some reason ??
> (snip)
> > Now, I want to write a DTS description where my DAI link uses
> > Component 0 (CPU) (with its DAI index 1) connected with Component 1
> > (codec) (with its DAI index 0).
>
> Thank you for indicating your DTS.
>
> So in imx8m_dai case, it has total 3 DAIs, and you want to use reg =3D 1.
> In such case, your DTS need to have like below, if my understanding was
> correct.
>
>         dsp: dsp@3b6e8000 {
>                 ports {
>                              port@0 { reg =3D <0>;         endpoint { /* =
not used */ };  };
>                         cpu: port@1 { reg =3D <1>; cpu_ep: endpoint { rem=
ote-endpoint =3D <xxx>; }; };
>                              port@2 { reg =3D <2>;         endpoint { /* =
not used */ };  };
>                 };
>         };
>

This works! Thanks. I didn't know that you can leave an endpoint unused :).

So please ignore my initial patch then.
