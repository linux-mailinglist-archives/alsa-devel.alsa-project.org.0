Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6901E65FDFA
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:29:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B480C141DC;
	Fri,  6 Jan 2023 10:28:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B480C141DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672997343;
	bh=7VURbdA/f33SHpyamMot+8CgwN1q8ppcvbxL7CrroNI=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rLalHl0odrDhTrrAgbJlCJuR9ckFq730Y2zOQaqcKGGrgqo20mi6imTHoBHOaPElz
	 PhmIFGOhzeHni5VAJL319iIGmdpyypyd9Cwf7UoDZHe6yxwfirV0skp1gipX9f2Fas
	 aV89FWzxmZviRiM0NHWs3Y2kyJ8CcXsBwBSFS3Es=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FC57F80238;
	Fri,  6 Jan 2023 10:28:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E50EAF8024D; Fri,  6 Jan 2023 10:28:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AA9CF800C0
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:28:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AA9CF800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ny/r6YpW
Received: by mail-wr1-x435.google.com with SMTP id co23so744101wrb.4
 for <alsa-devel@alsa-project.org>; Fri, 06 Jan 2023 01:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FtfE3nkhCAml+Y80MwjMTBRLqZ9ylrwR07F55wGMKag=;
 b=ny/r6YpW4HW4xQwX5Fjo9j33z/mGceoUqhrhEom2mFZ+zzm+XmbbbSw/mMl522BT2/
 1vXNpyJEBoK3+27mF6UzLWwSuXC4OWFQFZyZHrDsPeV1g0ugmX/CDW5iOJn+neIZXaco
 1XMGcVuacj5gGh9PnP6G4zJpQ59JIzeBG3om7M2/pFUWvF7SjomoB1hd4B/EhMZLhxrI
 WokJs8C+mVTmHj0OynWqeUIJvQCsH3nVF12Yskox4ePtioOvs1GGeDqZRzmICrUWLcrO
 JG4+Jl374AuwPwKKnRk7GGajOdrIs78evToPtKX03wXzFgGUXHwllLQiUgtBfHeoy0hj
 GwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FtfE3nkhCAml+Y80MwjMTBRLqZ9ylrwR07F55wGMKag=;
 b=cglliam2TerHBAIlnrwvBN0Q7wiHefixPQBxbVMlutIR6sJ9A7zs2U6rlDkMwHy4fk
 sUQH8TnG2OOxWwd4mfN28nxQA0li5Fno4L8G7lLjfkcradgHryc0Wf/H9d/86a4/nW+r
 D3KdeAV6Wre6jSQw42f5yrpckSnldSe+46EeW7fe8GfiZ6NAMOnNJ3ioT4JOIXbJfXps
 E/MlaW+ICgPwL4n0Vv7MZgyir86jHbKG2b03iCIRebY1uJEdjJonTHnqRGTPxMQCe5e0
 QvpI3BjW2zcWc+y/A347IjM9s4KPc6x6rJBlZFeG+A3aYGB7zkzecXf6WeFtD91kIB9w
 CwFA==
X-Gm-Message-State: AFqh2kruV+1sojpB/6QXR7qC4OJeGELjE8rNE/Ow3VGf3hFLeymSnWHM
 aIM3zJkuXvoeO6jg81ojtSU=
X-Google-Smtp-Source: AMrXdXuL6sD2mrHXcQ549uiiHPDtW3gv1yIp/RNc/vejzv9kWBuBp3MZIOlQomUKQzo4CYzTqUKMdQ==
X-Received: by 2002:adf:f9cb:0:b0:285:d0ba:92e2 with SMTP id
 w11-20020adff9cb000000b00285d0ba92e2mr24278711wrr.47.1672997280345; 
 Fri, 06 Jan 2023 01:28:00 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 i6-20020adfe486000000b002423dc3b1a9sm619553wrm.52.2023.01.06.01.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 01:27:59 -0800 (PST)
Date: Fri, 6 Jan 2023 12:27:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH 14/14] Fixed the retry_cnt bug about being zero
Message-ID: <Y7fplQ18qyhKDC44@kadam>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
 <20230106091543.2440-15-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106091543.2440-15-kiseok.jo@irondevice.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 application@irondevice.com, kernel test robot <lkp@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There are a number of issues with this patch...  :(

The bug reports were from kbuild so you'll probably need to just resend
the patch series from before as a v2 or something.  It can't be
[PATCH 14/14].  Where are the others in the series?

If you do fix these issues as a separate patch:
1) It needs a subsystem prefix like "[PATCH] ASoC: sma1303: " or something.
2) It fixes 3 different issues so it should be 3 different patches.
3) It needs a commit description.
4) It needs a Fixes tag.

> @@ -772,12 +772,13 @@ static int sma1303_add_component_controls(struct snd_soc_component *component)
>  	sma1303_controls = devm_kzalloc(sma1303->dev,
>  			sizeof(sma1303_snd_controls), GFP_KERNEL);
>  	name = devm_kzalloc(sma1303->dev,
> -			ARRAY_SIZE(sma1303_snd_controls), GFP_KERNEL);
> +			ARRAY_SIZE(sma1303_snd_controls)*sizeof(char *),
> +			GFP_KERNEL);

I am surprised checkpatch doesn't complain that spaces are required
around the * operator.  Please just use sizeof(sma1303_snd_controls).
Otherwise you have to use devm_kcalloc() to avoid checkers warning about
integer overflows.

>  
>  	for (index = 0; index < ARRAY_SIZE(sma1303_snd_controls); index++) {
>  		sma1303_controls[index] = sma1303_snd_controls[index];
>  		name[index] = devm_kzalloc(sma1303->dev,
> -				MAX_CONTROL_NAME, GFP_KERNEL);
> +				MAX_CONTROL_NAME*sizeof(char), GFP_KERNEL);

sizeof(char) is not required.  It's always zero.

>  		size = strlen(sma1303_snd_controls[index].name)
>  			+ strlen(sma1303->dev->driver->name);
>  		if (!name[index] || size > MAX_CONTROL_NAME) {

regards,
dan carpenter

