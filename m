Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 832351F8833
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Jun 2020 11:47:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 042FE166E;
	Sun, 14 Jun 2020 11:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 042FE166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592128049;
	bh=EjXFK6+m+nlDE0Z4mD/1zFjcodx5Ywxc1UTYokfucs0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ADL0BUKKvdRpzI4cItJeXABrCQJORojtGomn0caEGHeVs5VbkSv72yYjbvVkNUKNE
	 GjkbZxDHBOfxhUwdnsYxm6zAfF+//LnuiXflF9p1HSsnWqC4zudAKC1CgO4zklse/x
	 mv2QjS32rtM/QnLZecTG53EnEn3UYg8zRzmP13OQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 146ECF80232;
	Sun, 14 Jun 2020 11:45:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ED6CF8022B; Sun, 14 Jun 2020 11:45:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx.slunecnicejitka.cz (rosemary.pkrn.net [31.31.72.173])
 by alsa1.perex.cz (Postfix) with ESMTP id 9029CF8011E
 for <alsa-devel@alsa-project.org>; Sun, 14 Jun 2020 11:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9029CF8011E
Received: from [172.31.0.131] (ip-94-112-38-60.net.upcbroadband.cz
 [94.112.38.60])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: poki@poki.me)
 by mx.slunecnicejitka.cz (Postfix) with ESMTPSA id A685C40381;
 Sun, 14 Jun 2020 11:45:34 +0200 (CEST)
Subject: Re: Lenovo P520/Realtek ALC662 - front jack & mic in [FIXED]
To: alsa-devel@alsa-project.org
References: <ebbabedc-195b-afb7-d1e6-ce5523f92530@poki.me>
 <e523ea58-892d-4ab7-58aa-beb3c94a10a3@poki.me>
 <b25fc548-981e-5ae6-2895-ef9eb85912e1@poki.me>
 <f9cdb458-9e2e-c23b-675b-8b3ea55a8b51@poki.me>
 <70ccd2ef-8d72-221d-defe-6eb498e9f21e@perex.cz>
From: Jan Pokorny <lists@t.poki.me>
Message-ID: <3862bdf5-b526-b38e-465e-b2489ad364e0@poki.me>
Date: Sun, 14 Jun 2020 11:45:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <70ccd2ef-8d72-221d-defe-6eb498e9f21e@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Kailang Yang <kailang@realtek.com>, Mark Pearson <mpearson@lenovo.com>
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

Hello,

On 6/5/20 11:44 AM, Jaroslav Kysela wrote:
> Dne 02. 06. 20 v 13:59 Jan Pokorny napsal(a):
>> Problem solved!
>>
>> The solution was as simple as installing alsa-ucm package.
>> (Extra credit to Mark Pearson for pointing some recent changes
>> in that project out to me.)
>>
>> Color me very embarrassed.
>>
>> Perhaps the intention of keeping the package set minimal backfired
>> (EDIT: nope, nothing seems to be actively associated with that
>> package incl. opt-in ones), but frankly, have never needed this package,
>> not even heard about it before.
>>
>> I wonder why there are no pointers anywhere, at least in alsa-info.sh
>> output that would perhaps make the case clear for the experts amongst
>> you.  Or somewhere else, where it could be raised as a suggestion:
>>
>>     It appears as if you have a card/coded that relies on UCM for it
>>     to be used to the full extent, and UCM does not appear to be
>>     installed.  Try installing that software, commonly packaged as
>>     alsa-ucm.  Having it up-to-date may also help.
>>
>> [if not anything else, perhaps at least this makes it on-topic for
>> the list]
>>
>> Perhaps even close relationship between alsa-utils and alsa-ucm,
>> on the suggests/recommends level or something like that?
>>
>> On the whole it seems more enlightenment towards users is advisable,
>> on more than one front, mainly for the ignorants like me :-)
> 
> Thanks for this analysis. Please, create a Fedora bug for this for the 
> further analysis / fixes. The alsa-ucm is installed for the workstation 
> GUIs:
> 
> https://pagure.io/fedora-comps/blob/master/f/comps-f33.xml.in
> 
> See "Fedora Workstation", "LXDE Desktop", "LXQt Desktop" etc. All 
> depends on the "multimedia" package group which contains alsa-ucm.
> 
> Anyway, it's a distro problem, so move the discussion to the right place.

Yes, filed this wish to have actual functional dependencies more visible
at the distro _and_ deployment level against Fedora:

https://bugzilla.redhat.com/show_bug.cgi?id=1846787

Thanks everyone for the inputs so far

-- 
Jan {poki)
