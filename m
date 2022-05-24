Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E028532A78
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 14:37:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC8FF1712;
	Tue, 24 May 2022 14:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC8FF1712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653395850;
	bh=o1lrVeL1jiLQkOpbJ09lWXbv22kgyVmWlR41b4tdXPU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rMufIPniDKAnN4BtU4h3kYjOTXZ2dyJJzLddUb9kz1Fz84hy085efltijQhI3SABG
	 NeRa6GpSPyWYjBdiYUTvAD2rMnrtD0qZRxfF7sQ2r7eJxPwjoqn6Ssel+MvFUrgj6u
	 YR4IupoaQkzD+DkyRhSzNEPNFYxiRSfj1E4C3sgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D3ADF804D6;
	Tue, 24 May 2022 14:36:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48C2DF804D1; Tue, 24 May 2022 14:36:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 281CBF80100
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 14:36:22 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 359C3A003F;
 Tue, 24 May 2022 14:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 359C3A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1653395782; bh=IcXViZlauxY6FbHeAw9gysQ44HKPU4RFueuVKT5Zkh8=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=esWu3Xg94+r/CTjH5J7h8iRUCJnD3i1OmqcTSct0I+TqNCE3NoyFUttUpmR1FjW9w
 T1Su7tBK11mVpn/dD9MbOBpD+SDqguviiuAM8McPojYLRjwrdHbJ4U1VBti8gvMoYh
 ReS1XrApqom1Ns5EN2GFJTsQ6HRvqYj13BWSXfdw=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 24 May 2022 14:36:19 +0200 (CEST)
Message-ID: <afd7c233-39c5-b73f-75c7-728a8abbd434@perex.cz>
Date: Tue, 24 May 2022 14:36:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Request for setup of new repositories
Content-Language: en-US
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <YmagC3V3t0k84k9A@workstation>
 <7d90c47a-ce1a-d9d7-ba8a-e794f20487cb@perex.cz>
 <YmfZxmfv5dfgdYG1@workstation> <YmtNgqfFREYKZM6t@workstation>
 <YnO4A43EUdnG0b7n@workstation>
 <14235475-bd6b-4b86-61f4-8c2aa7f95838@perex.cz>
 <b6e986d0-b594-4543-ae63-e08e88ad3418@www.fastmail.com>
 <YozAmQFZ3LhqQoZN@workstation>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <YozAmQFZ3LhqQoZN@workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On 24. 05. 22 13:25, Takashi Sakamoto wrote:
> Hi Jaroslav,
> 
> On Thu, May 05, 2022 at 09:49:52PM +0900, Takashi Sakamoto wrote:
>> At present I prefer separated pages from source since the pages can be
>> generated from the source, however as you say the inclusive way is worth
>> to reduce repository maintained by the project. I test the idea later in
>> my libhinoko repository. When it looks well, I'll request you for
>> configuration change.
> 
> I'd like to fix the issue for the URL of documentation before releasing
> libhitaki since I put the URL to configuration for gi-docgen.
> 
> I'm investigating to put the documentation into the same repository
> where source is maintained, however I prefer to separate the two into
> different repositories. Then I suppose it good to put several
> documentations into one repository rather than maintaining them in
> different repositories.
> 
> At present, three repositories are maintained for documentations:
> 
> * https://github.com/alsa-project/alsa-gobject-docs
> * https://github.com/alsa-project/libhinawa-docs
> * https://github.com/alsa-project/libhitaki-doc
> 
> Let us consolidate them in one repository. For example, by referring to
> team name:
> 
> * https://github.com/alsa-project/gobject-introspection-docs/
> 
> The documentations are expected to be public under below URL:
> 
> * https://alsa-project.github.io/gobject-introspection-docs/alsa-gobject/
> * https://alsa-project.github.io/gobject-introspection-docs/hinawa/
> * https://alsa-project.github.io/gobject-introspection-docs/hitaki/
> 
> I'd like to ask your opinion about the idea.

Thanks for this idea. I just noted that github allows to specify a branch for 
the git pages (github.io). Do you think that a 'doc' or 'docs' branch in the 
separate source repos will be sufficient for your work? It may be more logical 
than having a common doc repo (logical URLs) and things (source and generated 
pages) will not mix together.

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
