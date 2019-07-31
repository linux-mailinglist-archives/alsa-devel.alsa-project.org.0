Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB3F7CB15
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 19:55:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67B2316A3;
	Wed, 31 Jul 2019 19:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67B2316A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564595701;
	bh=9gksbBNRtpIK5Jfd5XlTkKrqBZRVnUVFjXT9fpEvExY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z4HRleBDG8tKaWk6o8SAXzRn63aoBSr5VULbFBjMWxT0BONIm7WTwNbJwI5AD7qBU
	 l6pt1vFnbZ6wLZ7MuUBBlw01Vy77BvMroYcuKlp5qLxa3A/zMUas3F2MYS2SWcpfMq
	 BGIhc+P2VZOesJy4CDABUiDzhwjoGscXQjILOn1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7758CF80483;
	Wed, 31 Jul 2019 19:53:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B278DF80483; Wed, 31 Jul 2019 19:53:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 055ECF80133;
 Wed, 31 Jul 2019 19:53:07 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2BA42A0040;
 Wed, 31 Jul 2019 19:53:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2BA42A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1564595587; bh=sk6r6k3VpBA4fqT5xUbIM20NmqgVix9uDbjse1DVZEU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=3Wm6AJj/HwRNmmJ1B5RcwnOglMgOXroHYNJtrmlyeNMgpo4qQjT5ODHHJXmCe8Eel
 /YstsaJagLUWKNzELjFlcWInO+onk1uvuf1MYmMaUQcewPayWm8idmtZsm1W3OtrHM
 nLFFFqtDDKMEicOdk/0ZZY1eBq8MIAQdJUCozBlE=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 31 Jul 2019 19:53:00 +0200 (CEST)
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, "Lin, Mengdong" <mengdong.lin@intel.com>
References: <CAD8Lp45Bp1xVC7NjuNaANA7kAEN2Edshw+cViaTF3tRZEumgZA@mail.gmail.com>
 <cc9fa5b52138daffb09dc5b66ea9248379c9f60e.camel@linux.intel.com>
 <CAD8Lp46GW8n8K7ttOeSje_au06BsyvCp4seVwj2wNbipei5ssA@mail.gmail.com>
 <a4b17a75-d4e0-fc6b-a286-aa6b7b281b7d@linux.intel.com>
 <CAD8Lp444soO1i8mWF73eucT16yAhy2js1byWJCTV5fn=TikHBg@mail.gmail.com>
 <9e8b667f1aa2333dbcc34b5253372d1a8667551e.camel@linux.intel.com>
 <ee34f820-0753-dfbe-09c0-7147cf229cc0@perex.cz>
 <6493f195-eb5a-1a6d-2c31-e3a4123b2ad1@linux.intel.com>
 <7c940d90-297e-19c0-2f74-1843439d5ccf@perex.cz>
 <d41b02286db2a827648d1c1ec793bbd0a55e99c1.camel@linux.intel.com>
 <8dceb60b-35a5-93e9-ce01-1eb852e93f44@perex.cz>
 <0059ed8e8f2fbd7ffbc258ca53ce5efbf1885c5b.camel@linux.intel.com>
 <3f6f48ac-6eac-ba98-91ac-62c19578b1fb@linux.intel.com>
 <999df23199e5284459e66eaf351e2a2b66e25804.camel@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <53dc0a03-b262-c8d3-6782-77bc12cbaf8e@perex.cz>
Date: Wed, 31 Jul 2019 19:52:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <999df23199e5284459e66eaf351e2a2b66e25804.camel@linux.intel.com>
Content-Language: en-US
Cc: Jian-Hong Pan <jian-hong@endlessm.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 sound-open-firmware@alsa-project.org
Subject: Re: [alsa-devel] [Sound-open-firmware] Signed firmware availability
 for kbl/cnl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 31. 07. 19 v 16:07 Liam Girdwood napsal(a):
> On Wed, 2019-07-31 at 09:01 -0500, Pierre-Louis Bossart wrote:
>>> Any objections to using this repo for topologies too ? I know we
>>> haven't yet used it for UCMs but now is probably a good point to
>>> move
>>> (including moving the older UCMs over too).
>>
>> We'll need to figure out the license for all this, the topologies 
>> and 
>> UCM files created for SOF are all BSD 3-clause but I am not clear on 
>> older UCM files stored in alsa-lib, I don't think there was any 
>> agreement that the LGPL license applied to them.
> 
> I remember this was discussed in the past, it is possible to make all
> new UCMs and topologies BSD 3c in the new repo. We could also transfer
> over and re-license any topoloies over from alsa-lib where we had
> agreement from authors. 
> 
> This would eventually mean alsa-lib would contain "legacy" GPL
> topologies whilst alsa-ucm-conf would contain any new and BSD licences
> UCM/topologies.

I created the alsa-ucm-conf repository on github and invited you as the
maintainer:

https://github.com/alsa-project/alsa-ucm-conf

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
