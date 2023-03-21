Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 351876C34F3
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 16:00:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CE071FA;
	Tue, 21 Mar 2023 15:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CE071FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679410845;
	bh=w0G/peFAHxVlLGlKRGJoQBN8+px63dH/anbSpqG8NY0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GK1gtWaG5L4basGRGtjcagv/e6oJSwqwhBgcrcT1P8hSH2W/pPS7zFLLWW0Qi6RQt
	 EPsXvtPzFAvSupESF8VNx/Ox2hezDK8vd9x+ywHyMo6p46z2jqIzEqa13fckX2y7rC
	 MTy3q3gZnX9eW5hYjBpZP83ThEUAhyRCxs0Tluas=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E995F80254;
	Tue, 21 Mar 2023 15:59:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62250F8027B; Tue, 21 Mar 2023 15:59:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4555DF8024E
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 15:59:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4555DF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hS8bmPVT
Received: by mail-wm1-x32f.google.com with SMTP id
 v4-20020a05600c470400b003ee4f06428fso105541wmo.4
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Mar 2023 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679410786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQdfMbATqjaepYbqvYLKWR+Gh10juYRmAxqqQ1GJzRk=;
        b=hS8bmPVT10m236ifS3V+oeWoSuumlEv1GS4H9/g9ddnBzI4E1cHM7ezEoJcuQhfGAn
         tq6IffD5ITsVBquorpdi2ehcp+X3Jp4uyRSm5AV1GINtIYP8siNnWiwo6MMhUi6vo0M8
         iDmRwajuvy99XehYSJ9QeZQreZt15QxfOocn7v/7d2p1EEjf6vivNdQyZvbKBBStI2CQ
         5tYudlCHf8AGMTPIcJsdLx/yoPREw+orcYL7XUVp/OBKfiTybvVOPneBwfnAhweEgNFW
         8bTl2iHnWa+OunDlIIucJ8+eI/sO1o9ouTiZjibHrqxrY4j8weS3jqESvSpn3Wp3YezK
         Si/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679410786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQdfMbATqjaepYbqvYLKWR+Gh10juYRmAxqqQ1GJzRk=;
        b=DAkZfEIvTCiEGvtWpGv0s3EUdpxXeD9gNBFUWzfHZzdX9Xm3Wxdfyxxh3VMsfMvUKV
         p0g4moNPSXa5fRznzzVB4pCYMHcwdCgEwStCJlNinkEHwXfyPHoFmtbybMOltQiZxndG
         A7aHdM464pIZ4ipNADw2WMTgT5N6t8OG4Hp96y2CvFAnjhbYPs12747NnWkewnW9VnfI
         35w31Y9fg+jUvfDJuR28BpeKfeytpyQyLN6GruFvC0eldw1fUq6RNwQO+mADyRWY170W
         Gp45ydWPKYHcNecWB3F4SlGXWclxKff3AwO4Obqn61so+s2YO6HUlNxXnC5SKBvByGE0
         Omag==
X-Gm-Message-State: AO0yUKWEcGziNNVCNc+WzQ8syepCdXOO3+WkMHC6zSIjYT7ZN/jnjK+a
	IWdTac+FsYk4hl9QqCAQdCI=
X-Google-Smtp-Source: 
 AK7set/rOVlDDUdI546sD+v4J9G9V0rYrNO5h3a7xP0oQxvqM1QMCbTgs0h142Ppa9ycRoIof1gyIQ==
X-Received: by 2002:a7b:cd83:0:b0:3ed:3d89:1b4b with SMTP id
 y3-20020a7bcd83000000b003ed3d891b4bmr2826179wmj.8.1679410786575;
        Tue, 21 Mar 2023 07:59:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 u10-20020a7bcb0a000000b003eb5ce1b734sm14116447wmj.7.2023.03.21.07.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:59:46 -0700 (PDT)
Date: Tue, 21 Mar 2023 17:59:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: ipc4-control: Return on error in
 sof_ipc4_widget_kcontrol_setup()
Message-ID: <fffdb703-70df-4e23-a0f2-43b739be0e43@kili.mountain>
References: <20230321145651.9118-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321145651.9118-1-peter.ujfalusi@linux.intel.com>
Message-ID-Hash: TDNVB36URHXKFDHTO5NHYV272GHNN324
X-Message-ID-Hash: TDNVB36URHXKFDHTO5NHYV272GHNN324
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TDNVB36URHXKFDHTO5NHYV272GHNN324/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 21, 2023 at 04:56:51PM +0200, Peter Ujfalusi wrote:
> The patch adding the bytes control support moved the error check outside
> of the list_for_each_entry() which was not correct as at the end of the
> list_for_each_entry() the scontrol will no longer point where the error
> happened, but it to the list head.
> 
> Restore the original logic and return on the first error with the error
> code.
> 
> Fixes: a062c8899fed ("ASoC: SOF: ipc4-control: Add support for bytes control get and put")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://lore.kernel.org/alsa-devel/6be945d2-40cb-46fb-67ba-ed3a19cddfa4@linux.intel.com/T/#t
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---

Awesome sauce!  Thanks!

regards,
dan carpenter

