Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FACD6FD726
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 08:37:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83154106A;
	Wed, 10 May 2023 08:36:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83154106A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683700622;
	bh=cE/iTXxzWaGAooUTMRJusfOxLI9wKdFRgB75jvIjXKc=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IGwo0Zfb2Qdb/EQ8kATXkktz8DWSrCpRJyZ6xAY12Si1ejIH5ID++i/4GntUv0J1g
	 aph/TmzzeogxTPsyhwh8FDVf1/OPUH/VLaDOf98iV83xhqAC3E39Iocjv3JbxpV5EF
	 BcQ6OwIWlNE01WwHiwK3qmVk5pSs/hmC1yykjuTU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70576F805B4;
	Wed, 10 May 2023 08:33:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A222F804B1; Tue,  9 May 2023 20:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2328F80087
	for <sound-open-firmware@alsa-project.org>;
 Tue,  9 May 2023 20:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2328F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=akSghZ7S
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1ab14cb3aaeso44203395ad.2
        for <sound-open-firmware@alsa-project.org>;
 Tue, 09 May 2023 11:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683656814; x=1686248814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cE/iTXxzWaGAooUTMRJusfOxLI9wKdFRgB75jvIjXKc=;
        b=akSghZ7Se9pmPmR1Dog4+xIrgIQjaItB6PUg07W7Z5KvjGsHr3+Y9ms/VvLW2kjFqY
         WTLAZY/tRhy7B6ERvre9xzhW8teyntQAX2NJMXdVg9dr9rIQ7m8eqEH/tJZSMjiLSd7V
         iR/5r5DOK1+fhimUVga38ShiRGy4Kr6fBosUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683656814; x=1686248814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE/iTXxzWaGAooUTMRJusfOxLI9wKdFRgB75jvIjXKc=;
        b=BTAcYZmoT4Hh0Di75hYNZgJHYszLPrcpX7cPVzxsoDoa53f5lVzdNumLEfFHCiL+KH
         uxLq5ZosPQImElREpkMyT4zI527WLanA4gBgo5ROXE/THI2Up2Zja8/lq85BEdbWfXa1
         oMb8N3A7NgC7e3ulEXvYky1n6avoBkjH3Wdw33An5oqkyXFX7TqUlUtpLJYth+so7/cv
         7lA4a87FXEEeFUMInUWius/0dvydB24+HB4vhbwW4A1sFMyukIFrVb6jMfXpDSzmjKBn
         sanY71mZjDDpZjbQr6tomG+l7pCFGuy9ous0ugatd+jCb8lzP+qrCWQ28YJiwN4pe2P1
         bGrA==
X-Gm-Message-State: AC+VfDwnHlWwcyo9y33dKagpqA2l/ouy2SVO/e8KTxTSAy/THwgn5/jQ
	CZSQMIgMooCpSA1cXDoaagHT3g==
X-Google-Smtp-Source: 
 ACHHUZ7USCw+f6+Y88X0JV4fE3RAPgLecuhmkyYjlVi3U/0HsRlroP4pXhCLuo6S7cj0L796SU4pMw==
X-Received: by 2002:a17:903:238d:b0:1a6:83fa:b370 with SMTP id
 v13-20020a170903238d00b001a683fab370mr13804683plh.2.1683656814550;
        Tue, 09 May 2023 11:26:54 -0700 (PDT)
Received: from nitro.local ([64.141.80.140])
        by smtp.gmail.com with ESMTPSA id
 x17-20020a170902821100b001a6d4ffc760sm1905830pln.244.2023.05.09.11.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:26:54 -0700 (PDT)
Date: Tue, 9 May 2023 14:26:52 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
Message-ID: <20230509-silks-nimbus-take-0fdcd5@meerkat>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de>
 <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de>
 <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
 <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
 <ZFpaOVRc2E/CZBHI@finisterre.sirena.org.uk>
 <10075912-5c0b-549f-58e1-1323683d250d@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <10075912-5c0b-549f-58e1-1323683d250d@perex.cz>
X-MailFrom: konstantin@linuxfoundation.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-sound-open-firmware.alsa-project.org-0;
 header-match-sound-open-firmware.alsa-project.org-1
Message-ID-Hash: 7FFXL6SC5IAQXXIGUXXO2GDSJONQLZWI
X-Message-ID-Hash: 7FFXL6SC5IAQXXIGUXXO2GDSJONQLZWI
X-Mailman-Approved-At: Wed, 10 May 2023 06:33:09 +0000
CC: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7FFXL6SC5IAQXXIGUXXO2GDSJONQLZWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 09, 2023 at 08:03:39PM +0200, Jaroslav Kysela wrote:
> DMARC is a internet standard - see RFC7489, RFC8616. It means that the
> mailing lists cannot send e-mails with From from other domains which have
> restricted policies set by *their* administrators. So basically, all mail
> servers violates this if they keep the From header.

This is not correct. Operating a mailing list server is perfectly
DMARC-compliant as long as:

- messages have DKIM signatures
- ML software doesn't modify any of the signed headers
- ML software doesn't touch the body

-K
