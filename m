Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C306FA16B
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:48:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B14712CE;
	Mon,  8 May 2023 09:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B14712CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683532127;
	bh=tVYFuQcAAGwga6wxkcpWSfcpViEj4Phsj5nH2PnaDDk=;
	h=From:Date:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tj8Yo2PRLe4eFKLF0dKphNtvhdcTsctrrseA6EUPOk6uFmrXlCHFJ2RaYuHFLOsf1
	 CMMFTThEBnm3NwJyw52ICUefap8q0N6ZT8v/N4kvoPrsmUESIBjAjJ9geZzvf+ijEa
	 Z+s0NR5T02JxlY3Fh9AIwXvdW0SyiSUHvU/t5OYg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67466F805C3;
	Mon,  8 May 2023 09:45:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27C5CF8052D; Fri,  5 May 2023 15:38:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAFEDF80087
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 15:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAFEDF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=TBySTqTx
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-64395e2a715so1690891b3a.3
        for <alsa-devel@alsa-project.org>;
 Fri, 05 May 2023 06:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683293912; x=1685885912;
        h=in-reply-to:content-disposition:content-description:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mz4evSv67hQPNV6oClHQJu53Y2013LybJpvcP/3rYWU=;
        b=TBySTqTx6D329de6pIqxKPksV2SP41ErBZxOvFEAhZ5kQlqc0eJ5/NbmGyaT4gtAju
         Oqxh0fnWWcFFq4pNWDjDgouY3OBBklA+9z1iUZUrpcoYjGmg6/KsH0CLeysDBpOMz/aU
         5eqSMf9WIUB2NYcqtw+h0eYBE6qcZ9V2YJts8jZkI4LF6MmEfeE431yfjdpA25Cv6nyC
         gXXvu3e/LRKDwx8589uKdf4AeEkU5fp7oLRV7FvTI8I1yMlgxjEKIlJ6Gmi4DESPBnFL
         h/6e0zLmZoqPcL7VitXcgTUcex8Rsq9uzMEDyW7jgbljTJ3I9ja3MLMYKVXYoLSJ7Ley
         uJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683293912; x=1685885912;
        h=in-reply-to:content-disposition:content-description:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mz4evSv67hQPNV6oClHQJu53Y2013LybJpvcP/3rYWU=;
        b=Ffk3BdMu0ylV5t87unmnf5OdIWbW0Mzlk43YOA6AwEfxi6mK14eDxNvZ9B5mJoYfKA
         K/zUt/5aBKEc3KHjpbHXdbZ35otOhZ35Y/fVSdmmX8wrQ05JBCqWxhqM8EptT/thMIy9
         XqukO2YRcUpoB+UPJIgrUyy2eZuGIlylTpv6+7kF3neLuGtC61Ff9FevXKo5QervtBKD
         IN4h4eNJdWfeVS0FN5jvRVdrNBNnJQU3MEkXl2+Q/qw19Veom+8C5lc6uAwSh9ZStFOq
         X5K6/ZOGphoWD5iR+pu2PN4xnGdurJNDZ8eTlWWIAD+3yf5TILAPTpKqomaHCy7CY4Kq
         Ok2A==
X-Gm-Message-State: AC+VfDxDVuofAUqzOCvmXHwLX0hOHif6Bvgc2aX9CI5F6jlPn09AnlCm
	eTDZfqyoUyzba/Tdcu8Xv+o=
X-Google-Smtp-Source: 
 ACHHUZ6jqvBp3DoOq6QbmnOZPC1jBE589QcBJHn3Ic731Vt39CAjAls8FFVH+ZQr5GZDp92TA0lpEg==
X-Received: by 2002:a05:6a21:6704:b0:ef:ed72:779c with SMTP id
 wh4-20020a056a21670400b000efed72779cmr1761265pzb.8.1683293912071;
        Fri, 05 May 2023 06:38:32 -0700 (PDT)
Received: from yoga ([202.131.133.155])
        by smtp.gmail.com with ESMTPSA id
 y2-20020a17090a6c8200b0024e135c2ea1sm5248770pjj.18.2023.05.05.06.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 06:38:31 -0700 (PDT)
From: Anup Sharma <anupnewsmail@gmail.com>
X-Google-Original-From: Anup Sharma <AnupSharma>
Date: Fri, 5 May 2023 19:08:26 +0530
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: rt1016: Convert to dtschema
Message-ID: <ZFUG0vZG68hjZ0n9@yoga>
References: <ZFUFAmBJXvkQAG7m@yoga>
 <ZFUFrWqOHVmzE+ut@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Description: evicetree@vger.kernel.org,
Content-Disposition: inline
In-Reply-To: <ZFUFrWqOHVmzE+ut@finisterre.sirena.org.uk>
X-MailFrom: anupnewsmail@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Y4E6LW4S3UJUYKFVVZODCXURLL7HW7SY
X-Message-ID-Hash: Y4E6LW4S3UJUYKFVVZODCXURLL7HW7SY
X-Mailman-Approved-At: Mon, 08 May 2023 07:45:13 +0000
CC: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 oder_chiou@realtek.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4E6LW4S3UJUYKFVVZODCXURLL7HW7SY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 05, 2023 at 10:33:33PM +0900, Mark Brown wrote:
> On Fri, May 05, 2023 at 07:00:42PM +0530, Anup Sharma wrote:
> 
> > +maintainers:
> > +  - oder_chiou@realtek.com
> 
> If you're nominating someone as the maintainer for a binding it's
> probably best to copy them on the patch so they're aware...

Thank you, will keep that in mind. 


