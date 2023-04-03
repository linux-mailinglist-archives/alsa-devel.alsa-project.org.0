Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 682B66D3FD5
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 11:14:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 817651E4;
	Mon,  3 Apr 2023 11:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 817651E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680513280;
	bh=A8Is2M7oxQqzs05i72U4mz05RH408exsaC/R5aQP5k8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t/PthnyJYdM/Ld5gzqRfzJViJhGjcaMdNHQn+/260O3wEVS+657N+6gM6B7THprjX
	 Y/tBGebVbNYjlRSEhBggUpYLIWdK8fUa6ezvqprE1H+IPoelAL0908/aAKlvGXDyJy
	 oHFEISPk1h5d28gYvv5z/62+4usQiwuTMcCxKJAk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4567F80249;
	Mon,  3 Apr 2023 11:13:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF9CAF8024C; Mon,  3 Apr 2023 11:13:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 202E9F801C0
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 11:13:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 202E9F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=micKzf6P
Received: by mail-ed1-x530.google.com with SMTP id er13so73482760edb.9
        for <alsa-devel@alsa-project.org>;
 Mon, 03 Apr 2023 02:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680513222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pgIXEaT2+H6gQyFiw35tSG63XK4qxQI/gI/Cz+46yBE=;
        b=micKzf6PfBiNY9fSijQfbYNv9swhQe1WSN3VgT9CTm3yDoz4DqGtj3c5YXYplq5DK8
         bWVaLGO59bC/zuyK2v5Weh6NDEDlEyuOzh/okW19thY1gtDwCCGC6gu10SQ590r35vK6
         a97zB93I7AeDSOcIs0dKTaGrOSh1awL6TSXW0T+A0y5xXB4XzsfoEhkb4P/P39AcvMYz
         LJkjRE999ale30EKCcu1qEAt76AGEtq0QDF8ZS9yEEz+8MTkCx1PLfdpVJ8PITWHrRG6
         Pov0cujeKOoy75bu9DGxbpzS8u0L9wmoyelWgd+Fr50inzAhWdAUC+pjWZE8PttE1VfW
         RGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680513222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgIXEaT2+H6gQyFiw35tSG63XK4qxQI/gI/Cz+46yBE=;
        b=t92/zEpj004nPpoMA6fkm5FwVq8bMOrAPXLQZqEKtPL77BpJ4QmjWun//JhnYz/Etc
         V9FEFO6pECPrS0DmhTJT74GT+oKR4MjGHY+oMSbzU8zyuHeoGZqLa4LFSinupUC29byJ
         leRZ68Z/5gs5pJIpr9jy+Gzm3AudQIiSdQydjhYS+KgXIgCivdsDHuC/pLfgufsH1NEU
         JZ0qxwWyJKfcp/zvbmkFen9vesav4NDa779jLHSlyL1he1aXrj/4zOtj5LNDAYMrpEuy
         bu3x9jqepDWWviykEvqNcYGllkYX2Alwa3N0IfxvyfOkAmiRvmS2WAY1f+GCHN7+VrLY
         K4OQ==
X-Gm-Message-State: AAQBX9fYJ3mMnrshrmAhzXy2SGrxT36bwJdI0aP3VOHJM0VVlh1p+LvW
	5g33wZLcjxWeUeEIgm4mxbI=
X-Google-Smtp-Source: 
 AKy350Y0VqiU2PKD212i5Bq4IAjPQ4g/VsiKiyWy4Dhf72DhBYoVu0T58Qnq3lTXaf7dE4tFNibotg==
X-Received: by 2002:a17:906:cc5b:b0:930:9cbd:4e88 with SMTP id
 mm27-20020a170906cc5b00b009309cbd4e88mr34467369ejb.8.1680513221880;
        Mon, 03 Apr 2023 02:13:41 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a1709064e5100b009312cc428e4sm4242904ejw.165.2023.04.03.02.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 02:13:41 -0700 (PDT)
Date: Mon, 3 Apr 2023 12:13:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH for v6.3-rc] ASoC: SOF: ipc4-topology: Clarify bind
 failure caused by missing fw_module
Message-ID: <0ad876e9-761e-4cca-a955-99c6a7f710f5@kili.mountain>
References: <20230403090909.18233-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403090909.18233-1-peter.ujfalusi@linux.intel.com>
Message-ID-Hash: ALEN4EHRN6UJJWYZHWSQ5PNXORHB6QOL
X-Message-ID-Hash: ALEN4EHRN6UJJWYZHWSQ5PNXORHB6QOL
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, guennadi.liakhovetski@linux.intel.com,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ALEN4EHRN6UJJWYZHWSQ5PNXORHB6QOL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 03, 2023 at 12:09:09PM +0300, Peter Ujfalusi wrote:
> The original patch uses a feature in lib/vsprintf.c to handle the invalid
> address when tring to print *_fw_module->man4_module_entry.name when the
> *rc_fw_module is NULL.
> This case is handled by check_pointer_msg() internally and turns the
> invalid pointer to '(efault)' for printing but it is hiding useful
> information about the circumstances. Change the print to emmit the name
> of the widget and a note on which side's fw_module is missing.
> 
> Fixes: e3720f92e023 ("ASoC: SOF: avoid a NULL dereference with unsupported widgets")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://lore.kernel.org/alsa-devel/4826f662-42f0-4a82-ba32-8bf5f8a03256@kili.mountain/
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---

Thanks!

regards,
dan carpenter

