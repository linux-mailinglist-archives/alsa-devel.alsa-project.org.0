Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 711E5597F71
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 09:47:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D0871652;
	Thu, 18 Aug 2022 09:46:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D0871652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660808831;
	bh=BwOGLom7QZ+xlkzEkSbHx+Ss562vrDtAMtfCHnu5aHM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rAIAcoANljucWevbFrvtcqzxC4cF/bU7GhVGvtKaMG1Q49kJF+OcXWvScdpDTPdL6
	 h5FwUKZOzqCmY73sMK31SnIGaFT+dmgnly9wdb8RQoTUb+LE2j2gtWShegYZ20rE/5
	 PzVFixVieTQLBJEFJ2YLe4gMDdVP5Hte9LpecQtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8987CF80495;
	Thu, 18 Aug 2022 09:46:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 276DEF80430; Thu, 18 Aug 2022 09:46:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54368F800EE
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 09:46:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54368F800EE
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 3E774C800A2;
 Thu, 18 Aug 2022 09:46:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 8-OXr-g8Y69l; Thu, 18 Aug 2022 09:46:03 +0200 (CEST)
Received: from [IPV6:2003:e3:7f47:c300:41ac:9de4:5825:30ea]
 (p200300e37f47c30041Ac9De4582530ea.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f47:c300:41ac:9de4:5825:30ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id EEDF5C8009A;
 Thu, 18 Aug 2022 09:46:02 +0200 (CEST)
Message-ID: <920e65d4-5760-3e35-8b2a-dae4f9220632@tuxedocomputers.com>
Date: Thu, 18 Aug 2022 09:46:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Clevo NS50PU, NS70PU
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220817135144.34103-1-wse@tuxedocomputers.com>
 <87edxe9euc.wl-tiwai@suse.de>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <87edxe9euc.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Just realized I forget to change the subject and description: the NS50PU 
was already added by someone else, this patch only adds the NS70PU.

Am 18.08.22 um 09:43 schrieb Takashi Iwai:
> On Wed, 17 Aug 2022 15:51:44 +0200,
> Werner Sembach wrote:
>> From: Christoffer Sandberg <cs@tuxedo.de>
>>
>> Fixes headset microphone detection on Clevo NS50PU and NS70PU.
>>
>> Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> Cc: <stable@vger.kernel.org>
> Applied, thanks.
>
>
> Takashi
