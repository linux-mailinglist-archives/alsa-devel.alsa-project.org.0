Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B822C6C33DE
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 15:17:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B448E1F4;
	Tue, 21 Mar 2023 15:16:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B448E1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679408234;
	bh=buolBBz2TS/BQHKW2okzNtNor2t47YEJDd6f9gX1Y1Y=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OFy5jAEMw1Hmg/w7WwsXcyPGhJk48gjLdDHAl0jFrx+25Rdb2Z+wQfEJTYmnkq9Jb
	 g4PQPb6/CIzv68dvb6uIr7UUCKoA+xTAFSNnCriDERa6lNpiJy8VJgxV/oYNDH1qUa
	 pjOFpEhHJ3xxIpCfujDMMT4HZuDSH7fLI6k+cfXU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 045A2F80254;
	Tue, 21 Mar 2023 15:16:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FA4BF8027B; Tue, 21 Mar 2023 15:16:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D45EF800C9
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 15:16:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D45EF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hv0XTm17
Received: by mail-wr1-x433.google.com with SMTP id v1so7748575wrv.1
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Mar 2023 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679408169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U9fh9+ZhP7Qd9JWESljPubu/An2/vg1xP8MsU1pIJ9w=;
        b=hv0XTm17negQGzxwBKRBOtUWtxDJO5hYoVqVcezrlUA8Sf4So2XkfduiGf3m/dtkDk
         CV1JCThPN2Hw55i/JDXMlQL54TrYYWkSvY1pZosWwXRQM0OMXnBXnK5TUfQOH2EXuPEg
         H9xA/jf/A8tNPrwfAo1JJlMh2qJP5VnM6fBbD5fcjBgiLyT+vv8vFFUX7ZMdV3MAF927
         zHf5odssdqy6gjSTgTM25ZX9RbAxGRoiV0hVvDRmP6CDo8RW0f7X+lu6wWxHHce9OCoo
         1P5mbNnsk71oNtE8+iafwHwt1TKbIMGcpQEGy24fZoHsGUBK3UXx8GxLlan9CeSSQv6j
         1y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9fh9+ZhP7Qd9JWESljPubu/An2/vg1xP8MsU1pIJ9w=;
        b=6sYR/QZgKSFrqfqLHdb1dk5D4bXnuohJW48X8Qjo2EC3tfpZcyAcRm495RfmzB3XX/
         8w1HD/bE2F3wHWDoQaGpL94Id3p0bfcf/oXzhw+LyPmUQAIl2cqrTZygkRRQd3ZyjwYG
         GeQCegIj5zX+Pf7bem4TemzX1ArJe4tmyYaTY08f+YpvxTrSkxIvkZhPDnYCG9U4oIM7
         bf0O/xAzdR9+pOGtdponZaEuwdlKex9EfZLV5WcdfKmrkSmlKMJE4lY5tf8SMXqSsLb3
         txTobePNODAg1UtPd0hdcGwxUL3iXY8LRvgq72G2TVuDEuDVjzcl65cZ0kX17A7JE44S
         1+Rg==
X-Gm-Message-State: AO0yUKV/VYaQUEm4zN6TCbYu74uX+ZxbzvCNy/kRRbSBofClNQBvWcTB
	S5rB8hWFLyR0ToKGnB/Lto0=
X-Google-Smtp-Source: 
 AK7set+9G3mzcNY3GPcDRbpnaQ88tBuSuGfU1WrTVle9b4MmdYTdgNcTsmNKYBTmXBTlTnU93xM1mA==
X-Received: by 2002:adf:f2d0:0:b0:2ce:7219:42b8 with SMTP id
 d16-20020adff2d0000000b002ce721942b8mr2623862wrp.32.1679408169273;
        Tue, 21 Mar 2023 07:16:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 c15-20020adfef4f000000b002c7066a6f77sm11426233wrp.31.2023.03.21.07.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:16:08 -0700 (PDT)
Date: Tue, 21 Mar 2023 17:16:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-control: Return on error in
 sof_ipc4_widget_kcontrol_setup()
Message-ID: <c6e2f1d2-bdc0-4028-a9c3-5a077e52722d@kili.mountain>
References: <20230321134919.25844-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321134919.25844-1-peter.ujfalusi@linux.intel.com>
Message-ID-Hash: PUPG4E7JF6FKF5COU576TDFFIXTUO5O4
X-Message-ID-Hash: PUPG4E7JF6FKF5COU576TDFFIXTUO5O4
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PUPG4E7JF6FKF5COU576TDFFIXTUO5O4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 21, 2023 at 03:49:19PM +0200, Peter Ujfalusi wrote:
> The patch adding the bytes control support moved the error check outside
> of the list_for_each_entry() which will cause issues when we will have
> support for multiple controls per widgets.

Even now it causes an issue.  We're exiting the list_for_each_entry()
without hitting a break statement so the scontrol points to somewhere
in the middle of the sdev instead of to a valid scontrol entry.

The scontrol->comp_id will be some garbage value.

regards,
dan carpenter


