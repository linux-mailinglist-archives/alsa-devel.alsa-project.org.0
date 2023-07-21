Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C9175D659
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 23:18:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D673203;
	Fri, 21 Jul 2023 23:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D673203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689974306;
	bh=wQtCF1k2Z+9O7LkqJif+TbBnKJ2mbGUHBkFtKm4TQyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ElqEkLdAcaTMSRkiZniRN/oD6Ro9GYGYIW2fY2DkYBy/H90sKMk6HZbYFwAX8OpzP
	 2/Fgk95R15vrsPTZefsYlWSuCyYCrhrc/0LfsZ0T/TkQ57d0Ldi1UhXhW4fnyUXS/L
	 MiTZNeP6/QuuEB6QGPw3FGiGmqMJfNTMVLsJYsvQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 324BAF80527; Fri, 21 Jul 2023 23:17:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90BD1F8032D;
	Fri, 21 Jul 2023 23:17:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C19AF8047D; Fri, 21 Jul 2023 23:17:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1B09F800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 23:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1B09F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=WJZOWjc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689974222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f2CksioBG3mjJvGCQonqr0ZBTYtGb80XcIh5ZZevVPE=;
	b=WJZOWjc38hoqFBZpGRBQQ7aktWEQ1G09798JhDathnvZ1L0clGgEW/xx3eZTtNKWFF58P6
	mw0lN5/frYknHzsSkpU4jIHUL5RDIEnig9Am2ZdFBWwtbl/VC0XDAR6xHfP4Ac2DiwsPyQ
	NTWP/MEa/1gP5r2ohfGZiDxc1RkNjB0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-48w3kKrWNWqgGzxWLLurBA-1; Fri, 21 Jul 2023 17:17:00 -0400
X-MC-Unique: 48w3kKrWNWqgGzxWLLurBA-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-635f38834acso28700486d6.0
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Jul 2023 14:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689974220; x=1690579020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2CksioBG3mjJvGCQonqr0ZBTYtGb80XcIh5ZZevVPE=;
        b=Ja7ZghgYo95Rq2r06WbPKdRbffvKvgkCZ/wP07BWOEobI7EfUOQfqBLrqcJAs2CJVE
         ruA3aZDB4iAy2y/DejyDEszVEV2Y4U2se1GHUmBM2nVpjtjPj+Skbrz6O7x715c3LceB
         ub+ZPwJGU9HQYTQzvRR3aX5YxEzCtSDRKPeuoyBQ0had7rRuEGTLxVxboLnK+8U+OFy7
         3jD8jOLufb92l+qKe1VMDFBSDgBzpmYtD4Ng3m2Zfa5LR7kizviI93kQIc5vJUjoFls7
         37XgFE2sNU9Cd6J7Eq72iv1TtWitZMHbZ/aL1r7NoNOr3TpFJ75y3/DQ16YhNcx1HgoF
         0Pkw==
X-Gm-Message-State: ABy/qLZgN5cf7fEu+35MRdLLa7q8y1P+gV2FGxpcTgygLw9DJ5wnBHGM
	i397vMbZhZ5sNYlthYocuT3sS+Ogsta6RG/1xRTJ5ZDvSLaFjLZy+Jh36dKIOnfGPFwlEL3ntC/
	HP1cKMk2wB/OHFJompDVVSpY=
X-Received: by 2002:a0c:ecd0:0:b0:636:10ce:5203 with SMTP id
 o16-20020a0cecd0000000b0063610ce5203mr1192005qvq.38.1689974220353;
        Fri, 21 Jul 2023 14:17:00 -0700 (PDT)
X-Google-Smtp-Source: 
 APBJJlFi7MLn42ck7e1zCs2zr7hOu0xs9e+zv2wIO06MPZbmJ0CwqyqfAea4op3hSNeC6hTYu/bcmQ==
X-Received: by 2002:a0c:ecd0:0:b0:636:10ce:5203 with SMTP id
 o16-20020a0cecd0000000b0063610ce5203mr1191990qvq.38.1689974220164;
        Fri, 21 Jul 2023 14:17:00 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::17])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a0cf1c4000000b006375f9fd170sm1578237qvl.34.2023.07.21.14.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 14:16:59 -0700 (PDT)
Date: Fri, 21 Jul 2023 16:16:57 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: lpass: Log clk_get() failures
Message-ID: <pwfv6pbyggvbrs45v52qb4hmjrmdr7ngclhxw2gvlz34xuto2d@pnw3tmk2imlr>
References: <20230721165027.2155528-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20230721165027.2155528-1-quic_bjorande@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 5U4XI6LBQE5Y2VQ2YTG3YEF6FTQXU7FD
X-Message-ID-Hash: 5U4XI6LBQE5Y2VQ2YTG3YEF6FTQXU7FD
X-MailFrom: ahalaney@redhat.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5U4XI6LBQE5Y2VQ2YTG3YEF6FTQXU7FD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 21, 2023 at 09:50:27AM -0700, Bjorn Andersson wrote:
> The LPASS macro drivers all acquire a number of clocks, but give no
> indication when clk_get() fails, making it hard to identify and debug
> system configuration issues.  Make these drivers provide useful debug
> information when this happens.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

