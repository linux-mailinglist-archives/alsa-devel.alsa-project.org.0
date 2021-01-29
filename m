Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F86308A89
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 17:47:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05E0C16AD;
	Fri, 29 Jan 2021 17:46:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05E0C16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611938858;
	bh=ib36RgZ13UIdMTX8E+PdCxq4XoseUNd7o/h3aO76288=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aD/jKVFfB4erUBQ2mXsR7W2vUypy60AhGQ/S9iwZ9W4qdpf2MFZLbLl6xiVTX6qbd
	 qXB38ISfA+GA7eEaNLNgLiy+aqfzz3ZoK+Mu9Fuuwer8s5Mxn9Xb+LNqvP4QsawV3Y
	 Ly4hhEi8qHf+YyOvXVql5vjLkIBIjO8QNZakwMao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43887F800E9;
	Fri, 29 Jan 2021 17:46:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 656E9F80259; Fri, 29 Jan 2021 17:46:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C134F800E9
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 17:45:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C134F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MXicy9RM"
Received: by mail-pj1-x1035.google.com with SMTP id g15so6668550pjd.2
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 08:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ueX9Um5yYkNpG5ArDobqaS76e8j9PN3Jhag3IDVGSqo=;
 b=MXicy9RMRZXaAEs82DEwpCjoa87oxUSwaCjSgZSBNDy5p+ZAqEORXYjYos7z+2w5i3
 za67Yk84MaWfVjnbeR7oWVbiunMBvUPvV8JiXyeVa/1BY58uHh+onL3WANB8dKMPintZ
 w3HpzwiGdH+sPMCo1anYTvnNlPhETp2guHoMIH9LKMY03ZBpCD5bMePsUE6xu9IIglG3
 jPE5dC7sh5D6W+jnamDULEiNy1pLHfWwq3R/DtBwHHSUOoDeC4vbG5/8O3qhj7bHLfVM
 +D/bmPOyNAKUC9dFMqRAHfNu317gbcC31D5bCLo/V82wNtdyV9I+uubHTq+wT6J8i2nx
 tnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ueX9Um5yYkNpG5ArDobqaS76e8j9PN3Jhag3IDVGSqo=;
 b=CIdTGj8ff9mhMDtLRWQGYrpq05ZIJzevtg9vFdyIjm4GaZWgPcd6foWFrerpTUPbQM
 zDcLhJPaJcM88gXOvSKQFBtncX1T3fyHfCH7h9pUgNLnDobHhbeiTY+FdkpJi1THixDZ
 VskmhCrEtpZ6AMzRInSAdhk1EiHbWqC1x44HrBBnYQcuAXIieIHg6DIHxvvMFlPPfLLY
 NeFtAr1lszlRmyApz2rSxKIR/Y0l2wb2fKq/dWOt1T5bw29pfpvFBvKscCBoM/h9pUei
 2/cHD4qBDcQI7Ok+9eg72HPAyRDIgI9BBkCGgKq1V1mrvbsMyMBodLEnIpqqbOK3gZ7k
 H3Aw==
X-Gm-Message-State: AOAM532F1+ER7qq6Q2FwEeztnLBP81VJa4cFrhK7TIkx4Ir3yaE9UOAS
 uaFooBBzwoqIPkRRavry8N0=
X-Google-Smtp-Source: ABdhPJz2lT0niz+OSrRLRJ+zNW5FyO5kAwLT8XnILiwK0qAefHPYttQUoqZpl7fWqOndnn2x7+uewQ==
X-Received: by 2002:a17:90a:b703:: with SMTP id
 l3mr5148638pjr.60.1611938757741; 
 Fri, 29 Jan 2021 08:45:57 -0800 (PST)
Received: from [10.25.100.162] ([202.164.25.5])
 by smtp.gmail.com with ESMTPSA id y4sm8660611pji.34.2021.01.29.08.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 08:45:56 -0800 (PST)
Subject: Re: [PATCH 4/8] ASoC: tegra: Select SND_SOC_RT5659
To: Mark Brown <broonie@kernel.org>, Sameer Pujar <spujar@nvidia.com>
References: <1611920470-24225-1-git-send-email-spujar@nvidia.com>
 <1611920470-24225-5-git-send-email-spujar@nvidia.com>
 <20210129124454.GB4560@sirena.org.uk>
 <d6cb9252-246e-d6c7-7500-5f1d1823325c@nvidia.com>
 <20210129154858.GE4560@sirena.org.uk>
From: Sameer Pujar <dev.spujar@gmail.com>
Message-ID: <a5a8df4b-21d1-0a12-df7d-9e94c353e2b5@gmail.com>
Date: Fri, 29 Jan 2021 22:15:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210129154858.GE4560@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 sharadg@nvidia.com
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



On 1/29/2021 9:18 PM, Mark Brown wrote:
> On Fri, Jan 29, 2021 at 09:02:52PM +0530, Sameer Pujar wrote:
>> On 1/29/2021 6:14 PM, Mark Brown wrote:
>>> This is a generic device, not something specific to Jetson, why force
>>> on a driver that may not be required on other boards using this driver?
>> Yes specific boards using 'SND_SOC_TEGRA_AUDIO_GRAPH_CARD' may require
>> 'SND_SOC_RT5659'. But there is no platform specific config. Is there a
>> better way to enable config 'SND_SOC_RT5659' conditionally?
> If the user wants a given CODEC driver then they should enable that
> driver.

Above card driver is intended to be used on multiple platforms. DT has 
already a way for user to describe the CODEC connection required for 
specific platform. So idea is enable these CODECs from driver point of 
view for this card driver and platform DT can use what is required. Also 
the CODEC driver will be a loadable module here.

If above does not seem fine, alternatively can I just enable CODEC 
config independently from defconfig?
