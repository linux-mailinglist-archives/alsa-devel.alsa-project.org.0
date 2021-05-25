Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FE338FB40
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 08:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4F5283A;
	Tue, 25 May 2021 08:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4F5283A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621925562;
	bh=n6Yu5kGxX4LttREn1o3zOQ2u0KJ8kHdZSngGhW//R4E=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lC43cbedyLXwljTbgjWCUqclDCePY9dGt/oM/h7rm3dMYfQx5bXr/7Cmax+v3lvEj
	 l/936efWCcdDVD+CvfkWEElarrrT+wYOpsI6GtGvZiRrXwbeKBjgci9OC3F1enzTa6
	 N7T4VIPF23v4U+JRj67uK0LT1TjHogdYKbvAct6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DFB5F8011B;
	Tue, 25 May 2021 08:51:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B319F801F5; Tue, 25 May 2021 08:51:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25DB5F8011B
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 08:51:39 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9377EA0040;
 Tue, 25 May 2021 08:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9377EA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1621925498; bh=pfVbDj5skgzHFAJXA1C+F7utp8Mewi9c8m276MgKsbc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=yK6Iemf61oYbNlBMdnnslPpjes1nhyOc6llZWKArFVdWAvuA4lHsgkgTe7Ga9i5+q
 R6HvWRlzhnckcyoELzln2yZPNR/rcOzkx65vkaJtmIaIXfe4apbbbxGS+cApJE+85C
 7KRfAMVVPnSdLgpoB0rMWJ79V2ocKbg0297al1mo=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 25 May 2021 08:51:35 +0200 (CEST)
Subject: Re: [PATCH] ALSA: pcm: Need to check whether runtime is valid or not
To: ew.kim@samsung.com, Takashi Iwai <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <s5hsg2hhllm.wl-tiwai@suse.de> <s5h8s4hahxj.wl-tiwai@suse.de>
 <s5ho8df9inv.wl-tiwai@suse.de> <s5hpmxwbcp0.wl-tiwai@suse.de>
 <s5htun8bfa5.wl-tiwai@suse.de>
 <20210512044323.106673-1-chanho61.park@samsung.com>
 <20210512075834epcms2p182290868ca278decaa7e86c67f740db8@epcms2p1>
 <929757006.2969317.1620858694065@mail-kr2-3>
 <1932109751.3301982.1620952404404@mail-kr2-3>
 <1613950742.4603319.1621466175888@mail-kr2-3>
 <CGME20210512044441epcas2p4ad7c01a1dc9048bd96a9973760017d8c@epcms2p2>
 <914629993.5780046.1621896094629@mail-kr2-1>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <249b7eaf-9bf4-99dc-3266-30a463f5a694@perex.cz>
Date: Tue, 25 May 2021 08:51:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <914629993.5780046.1621896094629@mail-kr2-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 25. 05. 21 0:41, EUNWOO KIM wrote:

>    On Thu, 20 May 2021 01:16:15 +0200,
> 
>    EUNWOO KIM wrote:
> 

May I kindly ask you to follow the standard netiquette and send properly
formatted e-mails in the plain text ? Your e-mails are unreadable.

				Thank you,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
