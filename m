Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C76B18108C
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 07:19:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D29C51668;
	Wed, 11 Mar 2020 07:18:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D29C51668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583907573;
	bh=XD2A4rLPLqqhSsjPBf6lXWigtCUi/rE9D+rMVZwQ2V0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aNq4JoWtHhPNr16D1VkLcyWO11FsisxdWwhWvJm2PUbA5rHRalppvGkpZahzwbJpd
	 81U52oJLRb8wBIDgqX7XVYL9ZFIbHTPHvQPnUlRKztT2pzIsrsz8XA9bvwk71AENxU
	 leJubAEdHfGESb93XLPmcZHGn96x7KRmgF5B94yk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6E42F802DC;
	Wed, 11 Mar 2020 07:15:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF175F80217; Tue, 10 Mar 2020 16:49:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 110FFF80123
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 16:49:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 110FFF80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.b="SXaaUnju"
Received: by mail-wr1-x442.google.com with SMTP id n15so16482238wrw.13
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=JLUdZSd1H1lEETpHvCclAtf9Hxyai7jGSGVa9mBHeW4=;
 b=SXaaUnjufFDt8Mlnfyn9/nZlPn4Sx6yJeTDI9xCvB0eIdKUVY7sYTWP+92HvG9vn6s
 hxMoVzkzmbTNU/nbfIVXiPxyh1TZJEgXBe18cH53Z8C5SRpBpd8VnYKB8hswLRpiAVbx
 siJujdMUqn6EeQV4dClu6RdiAVRMN0A8eMh88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JLUdZSd1H1lEETpHvCclAtf9Hxyai7jGSGVa9mBHeW4=;
 b=uWqFp2Xh6C6pUyDwKNFpWqKNrC4xE/01c+CpbM5sAckJ2gZCs2uWxMowwrYPz4gBpP
 wstt7N9Wwtt0iSU+kWV4beyLe6qw9JWEoFxKa+v6qf24joqcOZf5NxxesUQV0a/rG4mv
 F8WsdjiVBUsUb3Cp2/9hkr+sm2kj3zqL6VknE+3HApOnEtDGLxsDfCsX/4q8rMKFkPro
 NVrPyrRGtC14adQ2G3jHcCrGQjGVWjROqeKMWi30W3wqJecGxtWOCSlrdvrfKD1DESTL
 cTIEqiC1qluLceoHRXANisb8xWnpEmQ/5zd3+BGsDK+Dj7mXeAbwXoUD4rrI9E3fCAP7
 uzsQ==
X-Gm-Message-State: ANhLgQ3d6RuN2ftmTTMnRW9tKSo9Zi+ZwHd4pAIvqVnaHaIlyDcVDgwP
 cacnxK9upoCFqnrSgdFVxEQGwg==
X-Google-Smtp-Source: ADFU+vv3M5cRnol8JRj1p0ysE6tMfdFNrNvEtcwqdFl+xa2EzKzZTzLC9tOnI+8oafPBbV9yqs7dYg==
X-Received: by 2002:adf:f70f:: with SMTP id r15mr28468158wrp.269.1583855354940; 
 Tue, 10 Mar 2020 08:49:14 -0700 (PDT)
Received: from [10.136.12.253] ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id b187sm1201195wmb.42.2020.03.10.08.49.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 08:49:14 -0700 (PDT)
Subject: Re: [PATCH] ASoC: brcm: Add DSL/PON SoC audio driver
To: Mark Brown <broonie@kernel.org>
References: <20200306222705.13309-1-kevin-ke.li@broadcom.com>
 <20200309123307.GE4101@sirena.org.uk>
 <69138568e9c18afa57d5edba6be9887b@mail.gmail.com>
 <20200309175205.GJ4101@sirena.org.uk>
 <8113837129a1b41aee674c68258cd37f@mail.gmail.com>
 <20200309191813.GA51173@sirena.org.uk>
From: Kevin Li <kevin-ke.li@broadcom.com>
Message-ID: <1165b736-d0fc-1247-6f46-94a51d392532@broadcom.com>
Date: Tue, 10 Mar 2020 08:49:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20200309191813.GA51173@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Mar 2020 07:14:40 +0100
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Scott Branden <sbranden@broadcom.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 bcm-kernel-feedback-list@broadcom.com, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-kernel@lists.infradead.org
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



> This is not how any of this is supposed to work, it's unlikely to work
> well with other devices.  If the device supports both master and slave
> operation then you should let the machine driver pick if the SoC or the
> CODEC is master via set_fmt(), randomly varying this at runtime is not
> going to be helpful.

Maybe the name "master/slave" is confusing, these names come from internal
chip signals and do not represent the state of the i2s bus master. Our SoC
supports only master mode in the i2s bus. The Rx and Tx block each have an
independent bit to indicate if it is generating the clock for the i2s bus.
The i2s bus clocks need to be generated from either the Rx block or the Tx
block, but not both.

