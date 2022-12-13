Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8185064B3EE
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 12:14:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09E4B21EB;
	Tue, 13 Dec 2022 12:13:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09E4B21EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670930053;
	bh=4dC4F1FastXdLtcL5ggnOaIcl6BcFinQjr4tizOFTRY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nCTesjz7M3E9WabLaPQETZqRfiTptVU9PXdJluSOgKeB8nQccKf6Em9g9JNkd6Ojt
	 I07Kg0JU+9vVu3d790DLEFiTmvZQgl65rebVYUnEFWV38xat4gXNyj6Xjelltgoagx
	 DR4f2yfMrre7B4Ppp0KH95QIpERAxhRv/LBvyCyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C05CAF80272;
	Tue, 13 Dec 2022 12:13:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7CF0F804D6; Tue, 13 Dec 2022 12:13:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91EDAF8047D
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 12:12:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91EDAF8047D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=JpFuv7XM
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C3DD3A0040;
 Tue, 13 Dec 2022 12:12:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C3DD3A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1670929972; bh=tM1oIZq60W0w1hW1Y2s3JiYZXpmWGqjPoeJHGpULZcc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JpFuv7XMSB1d7R0A6YxgIkKST3QoswpzS42rltECWdBHbe4VbeUqJKkWwgtsHo7KP
 zIRNr2gUYRHAlumKKJcaBgcQSGSfukhjoFTUjFg+79dCp6EpFCdOd2lTM0q9noNxwT
 ol+HEmqDFMky6IiVYdkSN3L2jagcnMlbZk3gc5e4=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 13 Dec 2022 12:12:49 +0100 (CET)
Message-ID: <2d2ff30b-4156-1aaa-464a-8f36601ad5aa@perex.cz>
Date: Tue, 13 Dec 2022 12:12:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] ALSA: conf: Save SND_CONFIG_TYPE_REAL with at least one
 decimal
Content-Language: en-US
To: Simon Svanbom <Simon.Svanbom@axis.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <f9a7ad6a256d4ad7a31642dcf875d436@axis.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <f9a7ad6a256d4ad7a31642dcf875d436@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "tiwai@suse.de" <tiwai@suse.de>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13. 12. 22 8:55, Simon Svanbom wrote:
> Hi,
> patch for saving SND_CONFIG_TYPE_REAL with at least one decimal as to not 
> misinterpret the value as an integer in snd_config_get_real. Example would be 
> the sofvol configuration property min_dB and max_dB, that are required to have 
> at least one decimal.

Thanks. I pushed this fix to repo using the snd_config_get_ireal() function in the configuration parsing code:

https://github.com/alsa-project/alsa-lib/commit/9f2c68cef716aa45942b502a42d94b84289f23bc

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
