Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E8842400F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 16:26:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F08A844;
	Wed,  6 Oct 2021 16:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F08A844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633530404;
	bh=P5fJRAs6hdeKxsNDMy/kRPP23vjvmQizvE/JaG3Gz7k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j390GIprgAGWDEE8xpUGOfa6dZGce8NNiIQOt4iFn1mX1mjUwovRXWhcxsKZYGdqR
	 mSfFsa1l/v949K7iZcE3ANCxVlNAhUWwwLQVeFeXWGz2NHw6DRx4zKpv5Z1SJr1kY9
	 g9cd9ArZe3Fj53V5pjIf+YP/BU6DGulT7Z6CiKcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CACC6F800FE;
	Wed,  6 Oct 2021 16:25:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7453CF80240; Wed,  6 Oct 2021 16:25:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9EBDF8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 16:25:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9EBDF8010B
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 5D86FC800AA;
 Wed,  6 Oct 2021 16:25:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id cK3OxzFKXTNg; Wed,  6 Oct 2021 16:25:14 +0200 (CEST)
Received: from [192.168.178.82] (host-212-18-30-247.customer.m-online.net
 [212.18.30.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id F0CF6C800A8;
 Wed,  6 Oct 2021 16:25:13 +0200 (CEST)
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for TongFang PHxTxX1
To: Takashi Iwai <tiwai@suse.de>
References: <20211006130415.538243-1-wse@tuxedocomputers.com>
 <s5hpmsib5wp.wl-tiwai@suse.de>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <ca37123b-5779-b546-089b-9af61f68a2b2@tuxedocomputers.com>
Date: Wed, 6 Oct 2021 16:25:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5hpmsib5wp.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

Am 06.10.21 um 16:10 schrieb Takashi Iwai:

> On Wed, 06 Oct 2021 15:04:15 +0200,
> Werner Sembach wrote:
>> This applies a SND_PCI_QUIRK(...) to the TongFang PHxTxX1 barebone. This
>> fixes the issue of the internal Microphone not working after booting
>> another OS.
>>
>> When booting a certain another OS this barebone keeps some coeff settings
>> even after a cold shutdown. These coeffs prevent the microphone detection
>> from working in Linux, making the Laptop think that there is always an
>> external microphone plugged-in and therefore preventing the use of the
>> internal one.
>>
>> The relevant indexes and values where gathered by naively diff-ing and
>> reading a working and a non-working coeff dump.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Thanks, applied.
>
>
> Takashi

Thanks for being quick as always ^^

I forgot to add cc: stable to the patch. Whats the best practie to do that after the patch has already been applied?

Just send it again mit with cc: stable?

Kind regards,

Werner Sembach

