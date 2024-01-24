Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DB883B385
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 22:03:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A0C983E;
	Wed, 24 Jan 2024 22:02:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A0C983E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706130179;
	bh=bAfj+lfShymZsoyfoask6vCqYCWRiyyMZUbTs15Vpx4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qGE/pZXHm+kDn1igHv9EXnes2PbZFjoWdY6gcS/OZG/92k5f2ORO0CveFRMMnCm8/
	 GOB5+bvTqTRcSu4SXfFW7r4msj5VfXFGid1FPyxVEUaX4wetD1h7HNmbhT/g23BefS
	 DNY1caECgg6nbPZy8oO7EcuKiDXZw1KmE+1Mg0xg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1FC6F8057B; Wed, 24 Jan 2024 22:02:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A06DFF8028D;
	Wed, 24 Jan 2024 22:02:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88C31F8028D; Wed, 24 Jan 2024 22:02:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 678F1F80149
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 22:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 678F1F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cCvkcVlB
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-339261a6ec2so4141486f8f.0
        for <alsa-devel@alsa-project.org>;
 Wed, 24 Jan 2024 13:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706130135; x=1706734935;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAfj+lfShymZsoyfoask6vCqYCWRiyyMZUbTs15Vpx4=;
        b=cCvkcVlBWofiYINehX+a1qDoBv3dIyZ9iTN5hCEgROw0tyFAnS+Ii9kx0dUmstruo/
         mi9yIRrpqxRW1YdfUHR5Nr4qqeSY2Vci7G7tZLz7S4u5i9hHs5DC4SD7WZGJICB6Neaw
         JBjUaep76PrxfJ9t7T5azGcsFSDkmOKgb7IE1I4+/B5q5W+ySPg63WzqDtlWbzOs8M7F
         md3Fu+JVU20jypbI0HAYYU6kyO8K4W9VG1th0kt60vDOrxBqtRUoSGpR1oiK6BEc2nUz
         5hBGbE8OoB2egI3O+t5un5f8asPA/lT/jGrjPLitqzNnvOskMpJkzgdfxVz+zcCC2B9R
         UIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706130135; x=1706734935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAfj+lfShymZsoyfoask6vCqYCWRiyyMZUbTs15Vpx4=;
        b=pXkbsCA5ELB3VtIXomO22IbsL12Ogm5VrCkQQQ1YnSahAH9W54KdC0nXcdFYZ4H2Ny
         qGNg329ce7DZjfmLyCi4WoxqPdGet1Abd5+gd5MKbYj8IsVD5sgWon7pXUfrslQ9LW02
         lurUoKmVxb7z8sfp5HgG7d2Bm6tkKN5RS1CQP/WnroZkCdsgLb6QheoelqAuzTHc4B68
         ofCs3AC6YeoJNsakpWUP/Ki4QY9cfRMV/a+3RuJHUqVmRnXTm90yRLG0x8ZVWfpcrjf/
         zYAug+WT+FMDEUBlUubJ6FfnNUfVySM5h35zLLAyF+XFq7tTjdswT4YSK+ziYfySmxwC
         /oew==
X-Gm-Message-State: AOJu0YztshQv/KHSiwF59uPWHThSrnRy+zUsowY2NVGv8z/Gr3BsJLSG
	ITSmesAoNjEvW4pBLoK5c+qwuORzSbZUGtwpz6Tv+dxac4k7hB1MFRbxse0JRI0QCvKcaPtaDfK
	1dpZZg0VMMrSk8/CWOF1oCIdJhT8=
X-Google-Smtp-Source: 
 AGHT+IGwGaxKf7Y8cfweBcRUvpL0St41Liw7fqV4ScKzacDTxGnaM89bGFd8uR2QyCCyum73jdgw2cuOIb4C0xkQIII=
X-Received: by 2002:a5d:4e82:0:b0:337:4b63:ea54 with SMTP id
 e2-20020a5d4e82000000b003374b63ea54mr881759wru.85.1706130135326; Wed, 24 Jan
 2024 13:02:15 -0800 (PST)
MIME-Version: 1.0
References: <20240124153016.1541616-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240124153016.1541616-1-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Jan 2024 23:01:38 +0200
Message-ID: 
 <CAHp75VfS9jFuxBQQ9B6FJ4nFBgsctY-GX5+53iVtz=UgdtAOEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] spi: cs42l43: Tidy up header includes
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lee@kernel.org, broonie@kernel.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IX4EM5POKP25OPTH4Q5B2I3VF2T6EC74
X-Message-ID-Hash: IX4EM5POKP25OPTH4Q5B2I3VF2T6EC74
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IX4EM5POKP25OPTH4Q5B2I3VF2T6EC74/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 24, 2024 at 5:30=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Including some missing headers.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


--=20
With Best Regards,
Andy Shevchenko
