Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AC02DA6F8
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 04:56:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCFF717B1;
	Tue, 15 Dec 2020 04:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCFF717B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608004613;
	bh=//v09dv9ILxke+En3izf8XvdM+PjP/U9TBszdhCtja0=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j+O3FEnWUSIf9E24oDMLZ+AW8WEyqNwo1t7gfrWaAF14bCSUek0IhMU3hJWZow50s
	 ml2vRtHPmJf2k4o4sYWGmARnIXz6Bg7NcXRGw2LHDAPFC+Z31S9S9gbWsfC9IsV976
	 Ob+rNTPZ7DROxWPynWZaQR2L0J3BfYmv6gebmICs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B5FBF8027B;
	Tue, 15 Dec 2020 04:55:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA995F8028B; Tue, 15 Dec 2020 04:55:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76A82F80259
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 04:55:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76A82F80259
Received: from mail-pl1-f198.google.com ([209.85.214.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kp1QZ-0002Kg-OK
 for alsa-devel@alsa-project.org; Tue, 15 Dec 2020 03:55:07 +0000
Received: by mail-pl1-f198.google.com with SMTP id h2so9768137plt.11
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 19:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
 :references:mime-version;
 bh=JrMtkS3qjXg4iLI9MSfcLzG6V958cN07eMYeOIYTk2A=;
 b=cSXyXOTxwsJsLsEhWKtx9dl9hhnhjUoEqSVLa+rQRa3ZqDVzJh2NzKyTqw87g22giR
 AT93l8fYIo65QynmVOhYaFrFjvYbaWsPO4U1QbSbX6IIjKsmEZL8BCkiGvLMuac+sH8a
 4xXT1Sr+EdISsXqQlakWtoljsvlEobOhDBxlrcPJVxrzyBSfB2CkPrlDPX1Yb6qihw+1
 tOK3XukSKy4fpDt/sa6iUYsOwUpp+69j92UBjzkBv49xd+SwYhg1F10QGAlxurXj91JG
 9wt+YkGUjcFtEvjWPPx6nWARj+prTU15Fkzx/sRzY71M24n858ys/oDM0/gPm0DrGslc
 HNcA==
X-Gm-Message-State: AOAM533i3QmbiD/5F+no4UCRMcPYET3ZyQjLhNhSIN7QfXoKAVfPIkVz
 TH/sB3OlzWOI+4Yd7/aQaoNf06EAIneC64TJscgGKLa7enMK5vJP93h/fyYNJfyaeWVpp6UoZrt
 isZe8UACX2ksQNNF2Axy1Qr35RLvBYfqTVvyHn7Ij
X-Received: by 2002:a63:cb51:: with SMTP id m17mr27443418pgi.337.1608004506060; 
 Mon, 14 Dec 2020 19:55:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgfX80tFWWmPsRBqh/P+gjTyeVcXl+xXzJtA3DCavMBUgNvhv7EL8osSjsnBHuodfAMu2CjA==
X-Received: by 2002:a63:cb51:: with SMTP id m17mr27443402pgi.337.1608004505676; 
 Mon, 14 Dec 2020 19:55:05 -0800 (PST)
Received: from [10.101.196.174] (61-220-137-34.HINET-IP.hinet.net.
 [61.220.137.34])
 by smtp.gmail.com with ESMTPSA id y129sm21534109pfb.3.2020.12.14.19.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 19:55:04 -0800 (PST)
Date: Tue, 15 Dec 2020 11:54:55 +0800
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [Sound-open-firmware] SoF support for 8086:9d71?
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-Id: <J74DLQ.CON4PD1O51YN@canonical.com>
In-Reply-To: <f05cb5ff-b5b1-2882-ba4a-380e696b2569@linux.intel.com>
References: <9I9CLQ.GP190FSJBRXK3@canonical.com>
 <f05cb5ff-b5b1-2882-ba4a-380e696b2569@linux.intel.com>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: SOUND <alsa-devel@alsa-project.org>, sound-open-firmware@alsa-project.org
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



On Mon, Dec 14, 2020 at 13:33, Pierre-Louis Bossart 
<pierre-louis.bossart@linux.intel.com> wrote:
> 
>> On more recent kernels legacy HDA stops working for device 8086:9d71:
>> [   47.211381] snd_hda_intel 0000:00:1f.3: DSP detected with PCI 
>> class/subclass/prog-if info 0x040100
>> [   47.211383] snd_hda_intel 0000:00:1f.3: Digital mics found on 
>> Skylake+ platform, using SST driver
>> 
>> However, only legacy HDA supports it:
>> 00:1f.3 Multimedia audio controller [0401]: Intel Corporation 
>> Sunrise Point-LP HD Audio [8086:9d71] (rev 21)
>> ..
>>      Kernel modules: snd_hda_intel
>> 
>> Ubuntu kernel doesn't select SND_SOC_INTEL_SKYLAKE, which builds 
>> snd-soc-skl, because based on the Kconfig description SOF should 
>> support it.
>> 
>> I wonder if SND_SOC_INTEL_SKYLAKE should be select again?
> 
> SOF does not support Skylake and Kabylake, and only the Up2 board for 
> APL. I am not sure what you mean by 'recent' kernels since this 
> dynamic selection has been in place for a year now?

Ubuntu kernel only changed this in 20.10 release.

> 
> At any rate, to make this work again:
> 
> 1. You can select SND_SOC_INTEL_SKYLAKE or alternatively to be more 
> accurate:
> 
> SND_SOC_INTEL_SKL
> SND_SOC_INTEL_APL
> SND_SOC_INTEL_KBL
> 
> There are known issues with Conexant codecs, typically on HP devices, 
> only Realtek codecs are supported.

Right, so we can't really enable this for generic distros like Ubuntu.

Let me think of a more generic solution.

Kai-Heng

> 
> 2. In addition you will need to have the topology for SKL/KBL w/ 
> HDaudio codecs. It's in alsa-topology-conf but would need to be 
> compiled and installed.
> 
> 3. UCM files should be already handled in alsa-ucm-conf
> 
> Hope this helps
> -Pierre

