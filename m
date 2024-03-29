Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 320C2894C0C
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:01:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4172F2C35;
	Tue,  2 Apr 2024 09:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4172F2C35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041285;
	bh=rbYNru4FvZk9/qOjGtXreS+71shEPoNntVgIjjLgs3Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NQB1wo7JyCSDU56LmAGv+Vgve8+qrlhZjy26hsDqv0CpF8CSrWjeS5qIUlpu0V1Ea
	 JAypVdL7Ylq16/S9kYX1XOl7eAsbF5GkmIbbV7HxUdDi4GdJvHNIAt+6DSm1BqrItC
	 JCwXdDCRBGPI6pp7ckWin/qr6D6/AbgYvCYTBh0E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A2E0F80C08; Tue,  2 Apr 2024 08:53:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40ABAF89875;
	Tue,  2 Apr 2024 08:53:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82151F8025F; Fri, 29 Mar 2024 04:49:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D08C5F801D5
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 04:49:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D08C5F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XXCeGqYb
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2220a389390so752646fac.0
        for <alsa-devel@alsa-project.org>;
 Thu, 28 Mar 2024 20:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711684165; x=1712288965;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbYNru4FvZk9/qOjGtXreS+71shEPoNntVgIjjLgs3Q=;
        b=XXCeGqYbpCmwvq9g2vB4BdGw2slZ9boqYPBrzLJmz3JHGzdUNj+B+hLjkBC9Bxqgw1
         C5qkZcG9+MGaLYvvLCdfWHZnVmD+tAme4tRoN7vUoESZaGE7sGPgSBWcrHUS6nTW5s6D
         jRTfVIABWSPG5o7bSvdNG4suaeZ7ANjU8tf5B+xuwR/cZmJKxEzo1x7A0udqVl/3Ea6D
         QiHvU+S3VZuMKGx99h6pIVyIoLHq5NppErKoddNbV+aKvZdfkHr0kD5aOkzox+1fenfz
         /i2gtWTXXWFSM++Jhb9UIgrgWnvEf+zmUx98ry2ykF6AdtrnLJAkFAkDY8oOPqe4tZ93
         ZJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711684165; x=1712288965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbYNru4FvZk9/qOjGtXreS+71shEPoNntVgIjjLgs3Q=;
        b=qoUNJzaR3aHzni+yxx4ETzwBqETwU+FXRmiTjDpMBXn0ZttPZ1ebjf3bLap6A5L83y
         qmKjLygSrB6+iViVSkfHn022cykEl7d5Ms9ZUZsh6zKGZKxKMRhwKYTVZGFg/uqEnqom
         7p/RiIMrSyh8OvXI4DJJz2Qbfen0GkFQA71l98Y54mWC+b2v9+t3VVUu+5BtnW0oDw+8
         09FOSXKH03m29sVqJK0IO9H+ZpfPkbbMRY2h6B5PqXkRQ8J08IRuP3LclskKVHw/GNnX
         nj/NSpr+djm3q8XGPg0X1eSpm1B3+0nm4I0K0pxTJDrxHmEIeh7P27E3UHvK5J8d+DcU
         3f6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnbp/CtE//RSsCiHEAbYp4Tnuy/w6DsUw573h3E8vkIBPw5r1IzElyVSMMsVPdHMjoehLS2yM8S+lJLJJ9DnRP2PsNoM6aHYzf/nw=
X-Gm-Message-State: AOJu0Yy2gIJqRu/Ix4T+PqGe6VvnYNu7Xf8swif/2nwWyfxWicMHhx/8
	jZw6O64GaYfQ40UxPw8uhwkXEnLsSkc8AgoWeAL2RltDOoeBU4NpTJk0AVb65DbwscjttG+agYq
	5hOrjkhB4bXN7H5i/fI0q3hRlQ+I=
X-Google-Smtp-Source: 
 AGHT+IGY696uQzEFN9nM4AzEb0MgJ37NkFzNoqo9gX0ZSgGVDWoHvK0+IqwNyDR0VO7NoE+/Zw1U+8f4i1NvVIgNIgQ=
X-Received: by 2002:a05:6870:972b:b0:229:7f31:6877 with SMTP id
 n43-20020a056870972b00b002297f316877mr552817oaq.4.1711684164989; Thu, 28 Mar
 2024 20:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240328014029.9710-1-animeshagarwal28@gmail.com>
 <5b917ec7-f8f8-489c-a804-70ea603262dd@linaro.org>
In-Reply-To: <5b917ec7-f8f8-489c-a804-70ea603262dd@linaro.org>
From: Animesh Agarwal <animeshagarwal28@gmail.com>
Date: Fri, 29 Mar 2024 09:19:13 +0530
Message-ID: 
 <CAE3Oz80_GuCJLNSPz1AL194-jFKPowxkJ852T90CjGfP+=nYfQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: ti,pcm1681: Convert to dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: animeshagarwal28@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2J3JVP4EAUO5ZV4TBS3FH3PQZ53F6JWC
X-Message-ID-Hash: 2J3JVP4EAUO5ZV4TBS3FH3PQZ53F6JWC
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:51:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Mar 28, 2024 at 2:27=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Why not existing driver maintainers? Do you have this device? Or use it,
> or care in terms of your projects?

I'll change it to the current maintainers of the bindings.

> Missing dai-cells, $ref to dai-common and unevaluatedProperties: false,
> just like in other simple DAI devices. Mention briefly in the commit msg
> adding these ("Make bindings complete by adding #sound-dai-cells").

Sure, I'll add it.

> Datasheet says it is dac, but we usually call it "audio-codec".
>

Noted.

Thanks and Regards,
Animesh Agarwal
