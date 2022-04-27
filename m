Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6945116C3
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 14:32:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65577171F;
	Wed, 27 Apr 2022 14:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65577171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651062742;
	bh=PAzNDVcDU4FQ4HNOHvPgY2V9tPWEH7ZWZwkznqXsyGY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bIAWhKG6Q8runEX0fu81SE/+rNxLBeoo08Vd0q5r3gwUoFvO+ufDeg0URa2FXs+uM
	 3zEZ7jVLP01WjbzZm8J9fX2ms5s2XNbt0cTw3KlQvVDk3k+VifrxkcPHeY2nk0C2Wc
	 BznGDLpckJSbFATdPy5EXI8g9gbqkpm4uYzEBbfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C03ECF80253;
	Wed, 27 Apr 2022 14:31:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46298F8016E; Wed, 27 Apr 2022 14:31:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFACEF80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 14:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFACEF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Iuj3aHn1"
Received: by mail-pf1-x430.google.com with SMTP id j6so1436281pfe.13
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 05:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iJKnthVaC5qASU+3blx58uF4/A1Fhq9zR9H4rOudSAE=;
 b=Iuj3aHn1jwBcyiMhTcfGV1YgubF4ItrTnV3R0mchYKs0LScJ14hsN2MuQK422Jmw3b
 Xuixfo7rl1DFdrvVr91DMXXwqUAa9i2Ds9ieFGN5NdiwIa6VUNCVedzR2Kae7YEE3nss
 yEuQMoQM2fnu05Sdrx2zeUICHCk8DMSrLWHoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iJKnthVaC5qASU+3blx58uF4/A1Fhq9zR9H4rOudSAE=;
 b=TREPMxf2bZA98DFJoKBS+FbG9wFnbzEdL94/SS+WDbGqx0LFyN/ZsXW1R4rKf+OW0b
 +j8ZN0/pkEbmFaXkaYVE8Rt6ayEYFzGVYRFCTotCTdw3FmSEosGVeDIgMXx/lAU+lb9j
 Ew+Qk7662jRWLSIi9/xxbqJqJ8+9Xf+8twORpFhKgh3PKzqGqgQcceB7JVaW73M+AhW6
 uhteZCLxQzVW/asM2VYOQY7jqx1JDTusdiZjRCAI7Iy+Cfr6xiLF9IsGdm/+IHaGvk02
 xvs1DTDtYEsSbHSna6sR1/L4J98jQr8BSx5NU8x8pOqd2RrR6qTNMBvi9r2oTf+nrOCR
 M3zw==
X-Gm-Message-State: AOAM5300WUO3M/HwBSnqwpsIO8bTfUDnG+EyU4a7INWI4ABbLaaUo9ne
 xBUarNIC2PUf1fRYdrbjjO6cSw==
X-Google-Smtp-Source: ABdhPJymed+/8YP3d0NNS5D7q2HUq1nM+1MvrmwcEPVHPho+SinsOPHbpZ2+WWpP34nXizxfCyEfJQ==
X-Received: by 2002:a65:414a:0:b0:3ab:84c3:3beb with SMTP id
 x10-20020a65414a000000b003ab84c33bebmr8083305pgp.369.1651062674122; 
 Wed, 27 Apr 2022 05:31:14 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e2d:263:26e7:c039])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm20402351pfj.79.2022.04.27.05.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 05:31:13 -0700 (PDT)
Date: Wed, 27 Apr 2022 21:31:09 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: ipc3-topology: Correct get_control_data
 for non bytes payload
Message-ID: <Ymk3jYPd1lpvfjBE@google.com>
References: <20220427105253.16640-1-peter.ujfalusi@linux.intel.com>
 <YmknCrJKihRkpyTq@google.com>
 <83698b90-855a-f5e0-11ba-94aba393a7b1@linux.intel.com>
 <YmkvBAgBrxRAMUcO@google.com>
 <03a5d9ee-90ef-e4b9-5117-e59e81407453@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03a5d9ee-90ef-e4b9-5117-e59e81407453@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, cujomalainey@google.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 Sergey Senozhatsky <senozhatsky@chromium.org>, broonie@kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On (22/04/27 15:08), Péter Ujfalusi wrote:
> > clang appears to be unhappy otherwise.
> > 
> > 	error: comparison of array 'cdata->data' equal to a null pointer is always false
> > 
> > Changing this into `if (!cdata->data)` is a little bit better as now
> > 'always false' becomes 'always true'
> > 
> > 	error: address of array 'cdata->data' will always evaluate to 'true'
> 
> Hrm, uhm. clang is right. The check is (and was) bogus...
> 
> cdata->data is a pointer (to cdata->data[0]) which is always:
> cdata + sizeof(struct sof_ipc_ctrl_data).
> Checking if it is NULL or not is irrelevant and wrong. If we do not have
> additional data then cdata->data points to memory which is outside of
> the struct and it can be random data (might be 0, might not be).

Yeah to be honest that's what I'm thinking too.

Does sof_ipc_ctrl_data have to be a var-sized structure? Or can that union
hold pointers that are allocated separately?

	scontrol->data = kzalloc(sizeof sof_ipc_ctrl_data);
	scontrol->data->chan = kzalloc(sizeof chan * mc->num_channels)

> I think we can just drop this check as we would not be here if
> additional data was not allocated for the payload prior?

I don't have enough knowledge of this code. ->data check doesn't do what
it is expected to do so removing it shouldn't do harm.
