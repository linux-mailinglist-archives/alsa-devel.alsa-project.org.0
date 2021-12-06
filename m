Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ECB46AE9A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 00:49:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 088292356;
	Tue,  7 Dec 2021 00:48:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 088292356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638834588;
	bh=JxMQgGqccNWUQd0RpRkxa9FD7KL6YpAzoDnbG7JLD1s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QRQRgn5NjJtQ1PZOZJ5PqzltrR5QHz3+KrO+5ssnyKN1VqVDWCQaJXNtf+N5Sg8CI
	 dSSdM0mrBgmSYk1agOiOQqxTwsg0m+pZgccl/ku5DofY8zwyteXdInKGBqhp0AZ8y0
	 W8EEouK54GtDBTKq48gVd9odxo8fAInLKRT3xRcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 889F5F804ED;
	Tue,  7 Dec 2021 00:48:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8596DF804EC; Tue,  7 Dec 2021 00:48:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hz.preining.info (hz.preining.info [IPv6:2a01:4f9:2a:1a08::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CBC0F804E4
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 00:48:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CBC0F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=preining.info header.i=@preining.info
 header.b="V1U8vb5i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=preining.info; s=201909; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hzMzy1zXRp0TtHr0icW2SoANj+8WxOG1nf1hBs517r8=; b=V1U8vb5ib240vxqZSeeD9S5n5N
 1/RXNxM0oLfZGovOrubA3F+egzpE2c4dL/h36vUNuuzoAfwTYbiil8LyWFz3DdcDR6XHIsrBTGL2v
 K58fxh8uERz9yT7TtTenEtEztCMtJm6vV7XrZxb2JM6IOcLqKZbtKWoMWidkRVz5P0MM1LnM+b3wn
 qnwBdi/AUGSOtEVQIdO7Y5hVe7aFDxqQso9Thg05wDw3l6jSzdBN66qmh2Mm3yQnYRCkIS0JBUt23
 Q9QKILwAwQiK+Qoh0UUYfisdEpSPPXBXJoE960DPO9DFMc8J0NECip8gQJYL5BhIp7BdIGkTSdmdY
 R/4NVAXw==;
Received: from tvk213002.tvk.ne.jp ([180.94.213.2] helo=bulldog.preining.info)
 by hz.preining.info with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <norbert@preining.info>)
 id 1muNiS-0003kE-Cf; Mon, 06 Dec 2021 23:48:16 +0000
Received: by bulldog.preining.info (Postfix, from userid 1000)
 id E0D761A7B32C1; Tue,  7 Dec 2021 08:48:12 +0900 (JST)
Date: Tue, 7 Dec 2021 08:48:12 +0900
From: Norbert Preining <norbert@preining.info>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: Support for 8086:ae20 Intel Smart Sound Technology on Fujitsu
 Lifebook
Message-ID: <Ya6hPK9zqD/kjHyx@bulldog.preining.info>
References: <Yat56SpjuUAxm2Gc@sakefilet.preining.info>
 <94bfe11e-c774-4f9e-1cec-297fcedfef85@linux.intel.com>
 <Ya6agUY8ClmkONp7@bulldog.preining.info>
 <f01c9a7f-7534-c4fa-ea24-c5bf4d120128@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f01c9a7f-7534-c4fa-ea24-c5bf4d120128@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

Hi Pierre-Louis,

> snd_intel_dspcfg: dsp_driver=1 option, which will select the HDaudio
> legacy.

Bingo! I carried that over (without thinking) from my previous laptop
(lenovo where it was necessary).

Removing the modprobe.d file, *and* installing the firmware files
helped.

Now the device shows up and everything seems to work. Puuuh.

Thanks a big lot for your help, that is much appreciated.

Sorry for the noise, and all the best

Norbert

--
PREINING Norbert                              https://www.preining.info
Fujitsu Research  +  IFMGA Guide  +  TU Wien  +  TeX Live  + Debian Dev
GPG: 0x860CDC13   fp: F7D8 A928 26E3 16A1 9FA0 ACF0 6CAC A448 860C DC13
