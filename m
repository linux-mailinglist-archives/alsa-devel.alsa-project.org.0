Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD996C34A8
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 15:47:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE4171FA;
	Tue, 21 Mar 2023 15:46:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE4171FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679410032;
	bh=sODQkR9y0inzDirArv/+UnI42S/tUbGv+5rK4D6maAk=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dAQLuXIkyHuvABoDdXSluR8NNZSYUMcaB8OwRJjyvCdWB3wFDzyekjMkx84qMe46N
	 3BUUkNZ5ajFvchxF4btG0Z8oXkXEjUrquD/O2ksu3YaLEbuzbm+H382UATdyhSkNm3
	 /YyW6VY3kOjVKxTjKTOdxAqfhLdJHENSJVint9HA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14EA5F80254;
	Tue, 21 Mar 2023 15:46:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2DCBF8027B; Tue, 21 Mar 2023 15:46:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 404EEF8024E
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 15:46:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 404EEF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=K/pa6yKI
Received: by mail-wr1-x42c.google.com with SMTP id i9so13961214wrp.3
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Mar 2023 07:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679409970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lY5KyFtU6Jcl4a4ne5RERqkoqxZlp89VEaPnb+Vzydw=;
        b=K/pa6yKIJFdqPp1/DP8SoQ6vXT4S7mY7OiR79QOoUbNH0JwtAssu+bhrKizmJgVtyL
         rYYkS8S9LMuilCmNqAMVF66PTZOGhf5SKKvA3x8XaaMzaaWORxjJNOdoSn3bHV5sd3i9
         G1HimK0q2zAiV6qpcR8Cmzxpy16i6pie7LSKR0l8uDW3smCEwHSkrrne7E57KGcTBCvG
         lMfHT7WPAqozwJzhC3oRmgSkscYbCOSmUttTlILnuN+SKd5b/xyU8EtvyrVKSyfmfQ82
         +iXICxbf/RiEiqc2RpQcok07cM78HTKR9qKUM2A4ATu4kewygdghy7M/iOJTfAeFT9pd
         tV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679409970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lY5KyFtU6Jcl4a4ne5RERqkoqxZlp89VEaPnb+Vzydw=;
        b=vAnBkpgfN+GpujXPwpEB87omhkACKiHkJenm3XPeaTSLhc77ZyZPI039b3TsIRALK4
         SAln3kWD6oJOpFHOPvSkoy91sKqlEF8CQ6NigqvSU0st/nezTgp1mgE0oPIbIRaBaQbu
         PC3WuLtw0qpNueh5Qf1IBox7ajEX4RcNQUWi/WxQB0QVv0Fc6jevdajXlX9gIQHTmnAc
         Vn/T8YUWpLWScWtfusEPZxPoB1tD5SWbx/DaIDG6jQlFTkhWOdq2e09FVh/25/qzgL4H
         NE4gU6nSeT90SU5GlhL9fbnj0dHhBccAonvsNvEEkVMPogIn3+zsNrEVKFimHETckLwf
         zavw==
X-Gm-Message-State: AO0yUKWDmKQfyneb4A0AKS5iHabtFwgT0DlKLdkBwitllnSxJN+oHnRu
	puq9itgpTC4VprEtJ/+PVcI=
X-Google-Smtp-Source: 
 AK7set86dRav+qu1+55zf2JVemNJ5bFtg6CVxBgwFSZa/dyQ2CDo6Qtmy6AWQsQ8WFcWEy7WWxV+Qg==
X-Received: by 2002:adf:cd83:0:b0:2c7:cdf:e548 with SMTP id
 q3-20020adfcd83000000b002c70cdfe548mr2747712wrj.71.1679409970572;
        Tue, 21 Mar 2023 07:46:10 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 e13-20020a056000120d00b002d7a75a2c20sm4151971wrx.80.2023.03.21.07.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:46:10 -0700 (PDT)
Date: Tue, 21 Mar 2023 17:46:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-control: Return on error in
 sof_ipc4_widget_kcontrol_setup()
Message-ID: <2b3f2d22-afcc-4552-b608-783801c7f2b1@kili.mountain>
References: <20230321134919.25844-1-peter.ujfalusi@linux.intel.com>
 <c6e2f1d2-bdc0-4028-a9c3-5a077e52722d@kili.mountain>
 <692de037-f69f-be82-7f8c-a00e03952c53@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <692de037-f69f-be82-7f8c-a00e03952c53@linux.intel.com>
Message-ID-Hash: L34JX3E3OQLRDDGPSDHF2NSYG2ZT5UQB
X-Message-ID-Hash: L34JX3E3OQLRDDGPSDHF2NSYG2ZT5UQB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L34JX3E3OQLRDDGPSDHF2NSYG2ZT5UQB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 21, 2023 at 04:40:05PM +0200, Péter Ujfalusi wrote:
> 
> 
> On 21/03/2023 16:16, Dan Carpenter wrote:
> > On Tue, Mar 21, 2023 at 03:49:19PM +0200, Peter Ujfalusi wrote:
> >> The patch adding the bytes control support moved the error check outside
> >> of the list_for_each_entry() which will cause issues when we will have
> >> support for multiple controls per widgets.
> > 
> > Even now it causes an issue.  We're exiting the list_for_each_entry()
> > without hitting a break statement so the scontrol points to somewhere
> > in the middle of the sdev instead of to a valid scontrol entry.
> > 
> > The scontrol->comp_id will be some garbage value.
> 
> I'm not sure what you see

No, the patch is correct.  My issue is with the commit message because
it says "will cause issues when we will have support for multiple
controls per widgets."  The bug already causes issues now.

regards,
dan carpenter

