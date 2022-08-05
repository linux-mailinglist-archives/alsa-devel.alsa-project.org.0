Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B2658A99D
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Aug 2022 12:44:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA74BFA;
	Fri,  5 Aug 2022 12:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA74BFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659696249;
	bh=E5YPKUflGIkdmZ8dtDCaxwOW/BNQnFF8ul6hSkFwUzo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MPUh1pH+7QiqMdjjw/aK8CF5ttix3t9IKIqiaPk8vgPlRiOpIClFpwrDtJW82ZcR5
	 7iNSm1mVr+22vD/Wiyg45C36mRcQsfMKD7c/zaJyeSuAgt66SVBgMewxJ6ZshV3fr5
	 mVzj9qr+gqH6yQ/cBPO8Xn0vRsXvYZwZSV9JGIhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09DD4F80271;
	Fri,  5 Aug 2022 12:43:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B729F8013D; Fri,  5 Aug 2022 12:43:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, NO_DNS_FOR_FROM, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02AE4F8013D
 for <alsa-devel@alsa-project.org>; Fri,  5 Aug 2022 12:43:03 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1C2AAA003F;
 Fri,  5 Aug 2022 12:43:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1C2AAA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1659696183; bh=9ll9ShT/oNeQRt0o7IkSw0wKkHvNbcJeYuEMI1ZhlsY=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=EFn4t5V1M8qZkmmGxMG1mjoDdOIJxGtPrui4+WkbDQq2vW2zOsb1dA47EK0gXCrG0
 1jPo4ey6iu6+B+OUb/AdE42aFhFQmshE39/uxbTZs5ILWhYsI8m4l9HxYl1GwxrUFA
 uqoNmmbDqsLk/i4rsyMlOh7AiP4Rfb2bhWA2HAvc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  5 Aug 2022 12:43:00 +0200 (CEST)
Message-ID: <e8d9c980-11ce-d0cf-6df4-5a6a7ee8b1f9@perex.cz>
Date: Fri, 5 Aug 2022 12:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Request for setup of new repositories
Content-Language: en-US
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <YmtNgqfFREYKZM6t@workstation> <YnO4A43EUdnG0b7n@workstation>
 <14235475-bd6b-4b86-61f4-8c2aa7f95838@perex.cz>
 <b6e986d0-b594-4543-ae63-e08e88ad3418@www.fastmail.com>
 <YozAmQFZ3LhqQoZN@workstation>
 <afd7c233-39c5-b73f-75c7-728a8abbd434@perex.cz>
 <Yo2JcNT9rQ0xw0+Q@workstation>
 <ef0ab4a6-ed6e-51e5-ffd8-397aa3e289ab@perex.cz>
 <Yo95YGyUSSBOipM2@workstation>
 <edd3a849-13eb-9a21-963e-f8cc8deffe47@perex.cz>
 <YuzwXjaXXtufCTvo@workstation>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <YuzwXjaXXtufCTvo@workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
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

On 05. 08. 22 12:26, Takashi Sakamoto wrote:
> Hi Jaroslav,
> 
> I apologize to be late for reply to the message, but I'm under heavy load
> to publish Rust crates recent few months.
> 
> On Thu, May 26, 2022 at 03:35:40PM +0200, Jaroslav Kysela wrote:
>> On 26. 05. 22 14:58, Takashi Sakamoto wrote:
>>> Later I'd like to use Jekyll backend of github pages[1]. Would I ask you
>>> to grant my privilege in the repository so that I can add configuration
>>> for it? I think the same privilege set in libhinawa-docs is enough.
>>
>> It seems that it's just a configuration file which is stored in the
>> repository, so the standard github pages setup should be sufficient.
>   
> Indeed. I can publish github pages with Jekyll backend with the concise way
> just to put `_config.yml` and markdown files without such privilege.
> 
>> Anyway, I made you as maintainer of this gobject-introspection-docs repo, so
>> you should do more changes in it, if you like.
>   
> Thanks for your arrangement, however I can see my privilege in repository
> settings just for archived alsa-gobject-docs...
> 
>   * https://github.com/alsa-project/alsa-gobject-docs/
> 
> Anyway I'm not so eager to have the privilege now since it's enough at
> present.
> 
> 
> By the way, now I published 30 Rust library crates in crates.io,
> enumerated in this page:
> 
>   * https://alsa-project.github.io/gobject-introspection-docs/crates.html
> 
> Currently I'm an owner of the crates, while I'd like to prepare the
> possibility to grant ownership to the other developers for future
> accident. Then I'm investigating to use "team" owner feature of crates.io
> service.
> 
> For the feature, the service of crates.io needs to query team membership
> in github.com, but the service should be permitted it by github service.
> 
>   * https://doc.rust-lang.org/cargo/reference/publishing.html#github-permissions
> 
> According to the above document, the way to grant the permission seems
> to be either to remove crates.io from the blacklist or add crates.io to
> the whitelist of organization's third-party access page.
> 
> If you, organization manager, don't mind OAuth access from crates.io, I'd
> like to request it via my github account. I guess that alsa-project
> organization currently has no effective configuration to third-party
> application access policy. When I requested it, you can see something
> new in the page of policy, then I'd like you to grand the access. When
> granted, I will operate settings for the crates to add team owner.

It seems that 'maintainer' priviledges are not enough - changed to 'admin' for 
your account in the gobject-introspection-docs repo. I have no objections for 
the OAuth access from crates.io .

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
