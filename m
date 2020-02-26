Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A01D16FF5A
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 13:53:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15717166E;
	Wed, 26 Feb 2020 13:52:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15717166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582721622;
	bh=Ss1DxhAlXwFasbOETeRivACMVvQBwqZ7h2ELjSI1OCE=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IAs0G2a7wKWUpSIFJsybxKkBy09X3Z9WP3IR39YExucqCpD5nKlRyLVQgx0Jm5dS8
	 tuEZGF19CqhwZM3jF1jvfa5LvcjOD/c1y/lQ0aph2bc52niUqdEQDTViB3Z3/Vv3QQ
	 ovmMimjo6EpDaIFdVu1XtGKj4DoRaIXo+xn5kvqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25EF2F800AD;
	Wed, 26 Feb 2020 13:52:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCF34F8014D; Wed, 26 Feb 2020 13:51:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from apparatus.de (apparatus.de [116.203.57.180])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97886F800AD
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 13:51:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97886F800AD
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by apparatus.de (Postfix) with ESMTPA id AE58CFF28B
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 12:51:54 +0000 (UTC)
Subject: Re: snd_dice: Clicking artifacts with TC StudioKonnekt 48
To: alsa-devel@alsa-project.org
References: <921a3b13-b44e-3300-bb72-84cbc9e3dd88@apparatus.de>
 <20200222012510.GA4883@laptop>
 <e29617da-9d34-c99f-f425-5d2aef59b623@apparatus.de>
 <20200224002031.GA10405@laptop>
From: Mathias Buhr <napcode@apparatus.de>
Message-ID: <3b42e75b-07ec-9dd4-b399-dbad30afc5a4@apparatus.de>
Date: Wed, 26 Feb 2020 13:51:53 +0100
MIME-Version: 1.0
In-Reply-To: <20200224002031.GA10405@laptop>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Authentication-Results: apparatus.de;
 auth=pass smtp.auth=buhr@apparatus.de smtp.mailfrom=napcode@apparatus.de
X-Spamd-Bar: /
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

On 24.02.20 01:20, Takashi Sakamoto wrote:
> Hi,
>
> On Sat, Feb 22, 2020 at 05:49:29PM +0100, Mathias Buhr wrote:
>> Thanks for your reply Takashi! It clarifies the situation. I'lll stick
>> with ffado then.
>>
>> Regards,
>>
>> Mathias
> Both of libffado2 and ALSA dice driver have problems for each, but it's
> a convenient option for users of Dice-based devices to use the former,
> at present. I've been improved ALSA dice driver for years with the other
> drivers, but it doesn't bring so hasty changes since it's a kind of
> reverse-engineering; no one knows the actual design and few ones can
> make discussion based on the fact.
>
>
> Well, I also own TC Electronic Sudio Konnekt 48 and I've investigated
> its protocol to configure I/O routings on internal DSP. After my
> vacation, I'll send information about it for your convenience
> (maybe next week).
>
>
> Regards
>
> Takashi Sakamoto

Thanks Takashi! I'd appreciate that!

Regards

-Mathias
