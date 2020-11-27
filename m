Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0F52C6C15
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 20:41:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 671C81891;
	Fri, 27 Nov 2020 20:40:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 671C81891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606506080;
	bh=xFrs2Fo/rbuv85HoeZEjujS/9j+KZ5Vr5X3Q3Lfzd/Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k6Kbu3P/rgr+P1CcDbRlYBs5hKAAHm0ewXoLUJEE59qVR9NIaywN1+OJTMnQhoJNO
	 zv6MmHnoQnmOn8/WJHe2esb4vDFbSJNKeQY7b/yeh8ctHu3DPllRirmPvqVerwzLDa
	 cRfrWxwBPlQ4+KMtIQ9tAVj5WMPLtHZrxPcAN4/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F264F80269;
	Fri, 27 Nov 2020 20:40:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0FF1F80268; Fri, 27 Nov 2020 20:40:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 708B5F80218
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 20:39:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 708B5F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="pdVVZsKG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=HDO0lvB/IW2WP8pQ3K4owXxOcixVsZDPop/IlMZ+VGg=; b=pdVVZsKGy8oWg3LV4u68OoiqBv
 i07JyFoeprOcDOSTRpMonapR2i3o3Wc2zxWlVYtJ52ZUWee874IW6h7Az152vLR1WF88VxirV1VCk
 8nbhscfPGw9VG9Y7Ie37+VERNfWS5BnD4hVAi6PvdBA2v9KKsif5WMvjHcLNK8+8S9v1TJaZ49+t2
 tnqK4UnYVoHM6iwWSLjByXNQix3lbecR5rIkOLBlVqWUlX216A9fxXjngAAZXo9qP5L7Hoik5MfpR
 Ux7pouaR+R0psAhj1L/Sl2dFy+M1F+ZkaHWSF6TKZKavBb33KEYAV22yzH8vbtu9A9jfVQ+6Msei3
 FKPAmgrg==;
Received: from [2602:306:c5a2:a380:9e7b:efff:fe40:2b26]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kijb0-0005cz-HC; Fri, 27 Nov 2020 19:39:54 +0000
Subject: Re: [PATCH] ALSA: ppc: remove redundant checks in PS3 driver probe
To: Leonard Goehrs <l.goehrs@pengutronix.de>, u.kleine-koenig@pengutronix.de, 
 perex@perex.cz, tiwai@suse.com, mpe@ellerman.id.au
References: <20201127094547.4zcyeycfrriitkqx@pengutronix.de>
 <20201127152259.1470079-1-l.goehrs@pengutronix.de>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <4b84b78f-1173-c357-da3e-02c9c347aa61@infradead.org>
Date: Fri, 27 Nov 2020 11:39:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201127152259.1470079-1-l.goehrs@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, benh@kernel.crashing.org, paulus@samba.org,
 kernel@pengutronix.de, Geert Uytterhoeven <geert@linux-m68k.org>,
 linuxppc-dev@lists.ozlabs.org
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

On 11/27/20 7:22 AM, Leonard Goehrs wrote:
> The check for the FW_FEATURE_PS3_LV1 firmware feature is already performed
> in ps3_system_bus_init() before registering the driver. So if the probe
> function is actually used, this feature is already known to be available.
> 
> The check for the match id is also superfluous; the condition is always
> true because the bus' match function (ps3_system_bus_match()) only
> considers this driver for devices having:
> dev->match_id == snd_ps3_bus_driver_info.match_id.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Leonard Goehrs <l.goehrs@pengutronix.de>

Seems OK with v5.9 on PS3.

Tested by: Geoff Levand <geoff@infradead.org>


