Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A073194848
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 21:06:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86385166F;
	Thu, 26 Mar 2020 21:05:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86385166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585253184;
	bh=uvlTjHdbuqMkJBzMYRmkNFN6wLlzPtlFGeNo7fSXqNI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MhQRADDo16tzegQX0E/5XGHbMB90747FpVi72jTY128PfyTOQw4j9ehYhPRP2Hi5P
	 InaUJWGQpYF3r9D1kB2PBh8jBMHqUBLuobfKPlPmiolIXOoE3SAbOwKRGaOdVjP4/m
	 SG12pc//806P+Ml3HwIlVXyfhXcNVELcgOrnSFpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58B8AF80227;
	Thu, 26 Mar 2020 21:04:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F669F8011E; Thu, 26 Mar 2020 21:04:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E64E7F8011E
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 21:04:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E64E7F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bUcqPYEU"
Received: by mail-wm1-x341.google.com with SMTP id b12so8234828wmj.3
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 13:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zbQ3Uwb6d8flUslu5Q4iOEydjhF66RY75GTAbvCC5Wg=;
 b=bUcqPYEUnPFMSXhJrn0P7yxgp7Wm8EpQLBOIhczj7WT1CZwlsNsCvygJd2cGP1jaNc
 xXVe92x6VwZNdqrz1wjElUoSpfvSpB6P+704Iq7oCAEHDJ7CzSx84HS+94vAjzQR7pko
 pQk5lwJPaPT91msJcAmdcS3TZBxAMjObyHDJiWgH0bqP5C81VViw17GnXPWI1Ddn1p8J
 qPI5YjGZqweSIzH28EGBwGsapNwVir3BpuuxBqokhadspKXTIzzDOK10IpmH+nchpepL
 yz8eai1ABqjYR7HkFY6r1VHmhPz5TaB+eHWF6eWFKZqXsyXBZOh0YE1Wzn/+VRemRucm
 YimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zbQ3Uwb6d8flUslu5Q4iOEydjhF66RY75GTAbvCC5Wg=;
 b=Ps4d8f+gCvYIWKduopzuA+Hz0t9wWAlWihoBKiMLUfmPndwnT+ZNZcWOcJrfDikWfi
 DNcRguKW94U+zHLPRnUBKrApINQCJwzx3Lf/vH9Su9uUhBN/zw+4D2mjTNcaiHPTnxtT
 W+2hShCE6wOI3ojGJh1Kr3wBLqnOBXQsB8jt/4NlTDdx48aXkB5XsgVFSwpi4XTCgfJf
 Qwn/X85COjoZmLOsUuJjk0tkHl5yDjXkHh5s+UYImy2KCxdC8vAW1tbWGWd2eotv7YmN
 PQhXNuhj2iAiUI03PC9rbqdVdyZGcj7AdXRhClM2C8v7CjF91uMIxdYPXHLOrPMdcnzH
 BoVA==
X-Gm-Message-State: ANhLgQ2SgIss1vQpxHvNbzS+RqS8/trHZg/mjkAksQ+3qLi4JoXUNr8U
 /iv9XBNbg7rpT+Ukb62k3Jc=
X-Google-Smtp-Source: ADFU+vuDePG3SgkJUDICukDIfduiYSC+himaO2rgnRgJj8DvyyQYf3DGmiZJImxmTotAS8uHNagGeQ==
X-Received: by 2002:adf:fe0f:: with SMTP id n15mr2555988wrr.204.1585253076499; 
 Thu, 26 Mar 2020 13:04:36 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id h132sm5270619wmf.18.2020.03.26.13.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 13:04:35 -0700 (PDT)
Date: Thu, 26 Mar 2020 20:04:15 +0000
From: sylvain.bertrand@gmail.com
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: sw_params for a direct-ed(dmix) hw pcm
Message-ID: <20200326200415.GA1321@freedom>
References: <20200321155303.GB357@freedom> <20200325174419.GA1224@freedom>
 <alpine.DEB.2.21.2003261350380.2957@eliteleevi.tm.intel.com>
 <9d986c48-184a-1d6e-4c5b-172a7ecd98a8@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9d986c48-184a-1d6e-4c5b-172a7ecd98a8@perex.cz>
User-Agent: Mutt/ (2018-04-13)
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Thu, Mar 26, 2020 at 03:36:23PM +0100, Jaroslav Kysela wrote:
> I agree. Also, the snd_pcm_direct_sw_params() does nothing, because the
> sw_params are already cached in the pcm structure (see comment). It means
> that the dmix (direct) plugins operates with those cached values. Just set
> sw_params like for any other PCM handle. The dmix uses those values (if
> possible).

This is the "if possible" which would impacts the way how code should do setup
right, but:

Let's take the case of a classic plugin "pipeline":
pcm:plug->...->direct::dmix->hw

From the top plugin (usually plug) to the direct::plugin, the "sw_params" pcm
op is usually pcm_generic.c:snd_pcm_generic_sw_params which does recurse down.
This recursion down will stop once pcm_direct.c:snd_pcm_direct_sw_params is
reached, then will recurse up, without error.

But pcm.c:snd_pcm_sw_params will copy anyway the provided sw_params into each
recursed back pcm if the "sw_params" pcm op return no error code, which is the
case.

Then looking at pcm.c:snd_pcm_sw_params_current, I get those "wrong" sw_params,
then I get no way to know something went wrong.

Why "wrong", because they may significantly differ from the bottom hw plugin
sw_params which some fields are used to configure the kernel driver.

for instance, a fast_op status call will recurse down to
pcm_dmix.c:snd_pcm_dmix_status, which will call the hw plugin fast op status
function which will use _its_ tstamp_type field for the ioctl call, but will
"override" the trigger_tstamp field computed with the "wrong" sw_params
tstamp_type!

It happens that the monotonic_raw and monotonic clocks can have audio
significant difference. Additionally, the other sw_params field might cause
similar issues.

regards,

-- 
Sylvain
