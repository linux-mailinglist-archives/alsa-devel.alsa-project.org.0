Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B3C90C94B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 13:27:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3BDADFA;
	Tue, 18 Jun 2024 13:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3BDADFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718710058;
	bh=bQfLNhr0U8kTl1L3wYkkfLY24a4W+lf/0ASZXstjAi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=upcX6R+RtJUiw170xCYXgJjj/jS795grRVqTE/8v/pBJBLYk33QDz/lsfGk9dvtQq
	 jemOwWlagBvRtBDeSxseAjDGTRP4Kl3gPqnpALCHcSxGaCxoP87PNkKCfttlaViwTy
	 I1pkjARiWLFC4Ei/hYLqa5m/vXbS0ofHndSqZ5Yw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F3E4F805EC; Tue, 18 Jun 2024 13:26:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9103F805C8;
	Tue, 18 Jun 2024 13:26:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9FC1F8023A; Mon, 17 Jun 2024 19:12:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82A8FF80154
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 19:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82A8FF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256
 header.s=2024 header.b=Ncp6BMIZ
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-705fff50de2so831247b3a.1
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 10:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718644317; x=1719249117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zvckpjEpH2uOs9aOOdBydw6yHWYMDuUzMnQ/KJxhXX4=;
        b=QWK5EbuRqGGHwKcaaVxOCDFchtMg7zUbLXoSkig2MzguTKrv2zofL+nuBut3VPHgQW
         Q7RCpXRFfvt3Jmyf6jMUt+0fOZEsD6EW0xYFhdVcghFQuoF4x4V14YBEe5OaF1J1ai9/
         doW1kKwA9653Fx/BjyEpsg+e6Ank3SILUgROGzYyEqxcLZiopy9IONGy29dokVOzb0M1
         6gY0GSWUR0UNnF5UO1T14tl0rCGivOJEVgxgp8kdxZbSTiNrJTfY6Gm/ytrIQJt2SnuK
         a7bmndrzoOLE+jTWd71y+sIxuIP3loSX6xkSQqWshyUMuVAAbUWTt8sL+91gFCsYmThH
         UBxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7JQGjefsxgYl+YoRNbkPuAw/LjQnJqzXNBWy3tmQTQV8hm++YA1a1RSu9aOj6Ujh3XeLiekgCC+7IE78N982ldX1TqaHTKgy9R9I=
X-Gm-Message-State: AOJu0YzF44DORrFdVL9oVSIBdEC9rFcRj2oEpyQcbAMDZYtQ1TiNNfD/
	OtKpZ8RCJxzfxtDncbJiSzLK5+Qf78ZvwFcnHi17y7obY3zY/wekjPwomElO
X-Google-Smtp-Source: 
 AGHT+IEpvx8oDxNqkEou9rQn23Am6pdR4u+cNRu+ZkVqeFYhca1Fq1ymn/C7x9An3U9SJF9ZufUo0A==
X-Received: by 2002:a05:6a00:9297:b0:6ed:de70:5ef9 with SMTP id
 d2e1a72fcca58-7061a9c528emr501333b3a.0.1718644316219;
        Mon, 17 Jun 2024 10:11:56 -0700 (PDT)
Received: from mail.marliere.net (marliere.net. [24.199.118.162])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc96868dsm7565177b3a.65.2024.06.17.10.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 10:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marliere.net; s=2024;
	t=1718644314; bh=bQfLNhr0U8kTl1L3wYkkfLY24a4W+lf/0ASZXstjAi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ncp6BMIZ4pWzzQA+l0B603lgqLVX7ZHa6cr6gTLjZhzo82zVWEorL/qvIBIaCplYe
	 2a3NWK4xv63+zEk7fqibpS2L8wlh5KHpGgdA1Vc/5xEbJ7Dt/00uOFfZeyl9R4Udxe
	 rYGGRcQMT0C07ZtEwDMjdH3XCx62xmyYS+9CFJn01QochRzZg+gA2YXeTz58mbwg/y
	 9GDT5ZQUJVEblnN8K6GnPcO4VLAiNjqnpzR7c1it3E1NsFSg5OdAzvZX4wAVxvdLLz
	 M8o/JfRlBS7szPz4zQNqE4BGs1N9l1YfCdxJvT6TgLB/Ren/h1b0+9QGnIcEukAqPw
	 jR3Tc1Udee1sQ==
Date: Mon, 17 Jun 2024 14:11:48 -0300
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Amit Vadhavana <av2082000@gmail.com>
Cc: srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, rbmarliere@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] slimbus: Fix struct and documentation alignment in
 stream.c
Message-ID: <d6cd7441-53f2-4c88-a361-729e3abe81c1@marliere.net>
References: <20240616203231.43724-1-av2082000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240616203231.43724-1-av2082000@gmail.com>
X-MailFrom: rbmarliere@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: M53GXHEPSZ7PMAT2CS3WNWQLEGDDPWMJ
X-Message-ID-Hash: M53GXHEPSZ7PMAT2CS3WNWQLEGDDPWMJ
X-Mailman-Approved-At: Tue, 18 Jun 2024 11:26:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M53GXHEPSZ7PMAT2CS3WNWQLEGDDPWMJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17 Jun 24 02:02, Amit Vadhavana wrote:
> The placement of the `segdist_codes` array documentation was corrected
> to conform with kernel documentation guidelines. The `@segdist_codes`
> was placed incorrectly within the struct `segdist_code` documentation
> block, which led to a potential misinterpretation of the code structure.
> 
> The `segdist_codes` array documentation was moved outside the struct
> block, and a separate comment block was provided for it. This change
> ensures that clarity and proper alignment with kernel documentation
> standards are maintained.
> 
> A kernel-doc warning was addressed:
>     ./drivers/slimbus/stream.c:49: warning: Excess struct member 'segdist_codes' description in 'segdist_code'
> 
> Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> ---
> Changes in v2:
>     - Removed `static const` keyword from `segdist_code` structure declaration.
> 
>  drivers/slimbus/stream.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
> index 1d6b38657917..863ab3075d7e 100644
> --- a/drivers/slimbus/stream.c
> +++ b/drivers/slimbus/stream.c
> @@ -18,15 +18,17 @@
>   *		and the first slot of the next  consecutive Segment.
>   * @segdist_code: Segment Distribution Code SD[11:0]
>   * @seg_offset_mask: Segment offset mask in SD[11:0]
> - * @segdist_codes: List of all possible Segmet Distribution codes.
>   */
> -static const struct segdist_code {
> +struct segdist_code {
>  	int ratem;
>  	int seg_interval;
>  	int segdist_code;
>  	u32 seg_offset_mask;
>  
> -} segdist_codes[] = {
> +};
> +
> +/* segdist_codes - List of all possible Segment Distribution codes. */
      ^ isn't a '@' character missing here?

Make sure to re-build the docs and see whether it looks fine.

Thanks,
-	Ricardo.



> +static const struct segdist_code segdist_codes[] = {
>  	{1,	1536,	0x200,	 0xdff},
>  	{2,	768,	0x100,	 0xcff},
>  	{4,	384,	0x080,	 0xc7f},
> -- 
> 2.25.1
> 
> 
