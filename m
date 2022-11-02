Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDE2617016
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 22:53:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D640C163B;
	Wed,  2 Nov 2022 22:52:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D640C163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667426024;
	bh=CAXmNDqw3R9TEdENrUnA6H8Sfz9kM+6hXtsSbJ20eio=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VHT8YCjnzduaHt1zcpihzHegLgGhkUIrou+MsYe1Wdg4E/X64gJpjH7gcBbquq3Jf
	 ZMeN0sgNDOA0pz+y7cJykj/UlaYhf4IcUxLUuFHd/Kya8MDosCubQCPx5Qb+mQKs3a
	 WXpKtc4HBBIUahAqTNJZppzAbeQOiVefHHFUOvew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 277B8F80155;
	Wed,  2 Nov 2022 22:52:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A196BF8026D; Wed,  2 Nov 2022 22:52:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=HTML_MESSAGE,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from 7.mo548.mail-out.ovh.net (7.mo548.mail-out.ovh.net
 [46.105.33.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78B99F801D5
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 22:52:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78B99F801D5
Received: from mxplan2.mail.ovh.net (unknown [10.108.20.195])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6C6C220A26
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 21:52:39 +0000 (UTC)
Received: from gnuinos.org (37.59.142.108) by DAG5EX1.mxp2.local (172.16.2.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 2 Nov
 2022 22:52:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S0029d384dd9-7574-4b76-878b-4f0506cebac0,
 1DFBCCADF7BBE204CC0E3BBD30E5C178FDFA6A19) smtp.auth=aitor_czr@gnuinos.org
X-OVh-ClientIp: 88.10.253.183
Message-ID: <b5a0798d-68ad-bbb1-97af-8ea11aed9e31@gnuinos.org>
Date: Wed, 2 Nov 2022 22:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: building aplay / arecord
Content-Language: en-US
To: <alsa-devel@alsa-project.org>
References: <CAG74igXPJjnQF6-nbXn2bXywWA0cKpR3cDhYPwg=fKN6J_yZZA@mail.gmail.com>
 <Y2KJntHXy19DEBck@shelf.conquest>
From: aitor <aitor_czr@gnuinos.org>
In-Reply-To: <Y2KJntHXy19DEBck@shelf.conquest>
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG7EX1.mxp2.local (172.16.2.13) To DAG5EX1.mxp2.local
 (172.16.2.9)
X-Ovh-Tracer-GUID: 9ac2a255-229e-4e6c-9df9-4f478cdb8ab9
X-Ovh-Tracer-Id: 16620252951775864343
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrudejgdduheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpegtkfffgggfuffvfhfhjghisegrtderredtfeejnecuhfhrohhmpegrihhtohhruceorghithhorhgptgiirhesghhnuhhinhhoshdrohhrgheqnecuggftrfgrthhtvghrnhepudelveetveekjefhvddvkefgkeffhefghfeuhfevleekvddtueethedvhfevtdefnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorghithhorhgptgiirhesghhnuhhinhhoshdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghlshgrqdguvghvvghlsegrlhhsrgdqphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi David,

On 2/11/22 16:15, ael wrote:

> On Mon, Oct 31, 2022 at 06:04:26PM -0700, David Jaffe wrote:
>> Newbie question...
>>
>> I downloaded the alsa-utils source and it says to run ./configure.  But no
>> such file exists.  And if I go to aplay and type “make aplay” it can’t find
>> a file called “aconfig.h”, which is presumably written by
>> ./configure.  What am I missing?
> I think that you need to run autoconf on the configure.ac file which
> you should have: it is there in the git directory.
>
> Perhaps read
>   man autoconf ?
>
> The INSTALL file does indeed say run ./configure without explaining that
> you need autoconf if ./configure is not present.

Projects making use of the autotools often provide a script named `autogen.sh`
to do the job concerning to autoconf. Try with this:

$ autoreconf -f -i -s

This will generate the configure script.

On the other hand, as suggested by ael, the manpages will give you the meaning
of the arguments passed to the command:

$ man autoreconf

Hope this helps,

Aitor.

