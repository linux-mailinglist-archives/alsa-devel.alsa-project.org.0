Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9E35EB48F
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 00:29:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB0F4826;
	Tue, 27 Sep 2022 00:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB0F4826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664231346;
	bh=8LS0Sft6HQa/4wmV36gDvW5S2fVgulbDTo2lrYlX6jI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rhJQ7vW+JpoLGn3N9khECQw1xjjEa7g5pWdoo+vwEUKKeIs1XHXycPnFL3lfvH68x
	 NZjM73d/SAOH9FAKt8NuR866Yfa9IBNqb4/0MbOlhlbmQn8soqHyqz8XfPbttCpIE0
	 hfpZsfgsC54mviI/+mvEXy/lS/th2KjtIyBjul0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B2C9F80115;
	Tue, 27 Sep 2022 00:28:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 432F3F8027D; Tue, 27 Sep 2022 00:28:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from omta033.useast.a.cloudfilter.net
 (omta033.useast.a.cloudfilter.net [44.202.169.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBE89F80134
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 00:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBE89F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com
 header.b="JBQdcnhc"
Received: from eig-obgw-6019a.ext.cloudfilter.net ([10.0.30.145])
 by cmsmtp with ESMTP
 id cuGxoald5h3t8cwZwoPAIJ; Mon, 26 Sep 2022 22:27:56 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTP
 id cwZuoa4ygZ4ClcwZuoEoXe; Mon, 26 Sep 2022 22:27:55 +0000
X-Authority-Analysis: v=2.4 cv=I9x2+fsg c=1 sm=1 tr=0 ts=6332276b
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=aukr7FhhocSji02eYO7jmA==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10 a=xOM3xZuef0cA:10
 a=wYkD_t78qR0A:10 a=iox4zFpeAAAA:8 a=foHCeV_ZAAAA:8 a=VwQbUJbxAAAA:8
 a=P2InLthoESwt6vYYg4gA:9 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
 a=h8a9FgHX5U4dIE3jaWyr:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4qq7HZal1zXmdipeTuMCQi90iSHTfHneYxHZyhIjH3k=; b=JBQdcnhcWkrdtfhnIY+ItiYfLA
 SuZmvVNJtRFIRQ49zbxk91lBjJ5SbBysC7ArpbVOeAWWtLt4H0KlGimmzD2u0U6+UPUeCDBDT2nAk
 alw/D1AvrLeEZ7z9W49dTQbQXoMroTu3Fs7h4pnDiN5UPy8pUfjIdhuyHCUYRyRT/tYA0fw8dNgl4
 yAOJASCvp3eqyIf/jlhjxAwYn3mIov3Mom/UKCBsVrwP2cu5pOcErmU0wMG1xi4qlpVLbQQt5BqWs
 QHz+x8mKDOBoUR8Pb4nvngtB+aUwkMYpwZ3r7EmkWm5Ew9WnHJaa8FXYNhMVFBfKQs9Ej8Y/5P6Q4
 KJJfQREQ==;
Received: from 187.184.158.174.cable.dyn.cableonline.com.mx
 ([187.184.158.174]:20322 helo=[192.168.0.24])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <gustavo@embeddedor.com>) id 1ocwZt-003JXQ-3T;
 Mon, 26 Sep 2022 17:27:53 -0500
Message-ID: <81af0106-a732-ce45-bb1c-c45db9e1aeb9@embeddedor.com>
Date: Mon, 26 Sep 2022 17:27:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH][next] ASoC: SOF: control.h: Replace zero-length array
 with DECLARE_FLEX_ARRAY() helper
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <YzIcZ11k8RiQtS2T@work> <YzIj6tdtDe9YrX+I@sirena.org.uk>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <YzIj6tdtDe9YrX+I@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.184.158.174
X-Source-L: No
X-Exim-ID: 1ocwZt-003JXQ-3T
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187.184.158.174.cable.dyn.cableonline.com.mx ([192.168.0.24])
 [187.184.158.174]:20322
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHKIBNcLhoyIUHk8C41F8zpAAshohFhU1BkaOd021PX8pdaIGcftGXq5zErG6EVpu6/TX8zs9B7FXqjPRPXV//hKivoW91aYiUNCZqCPg1CYUpBxgwpn
 lZtQDrtA8f8VuuOfSumzKdbLllsmn7Td11zLscD9wN9L293YtLWbZsyZFxRlln+iXXe6S21ZmaKS+exxL4/GC5lSrEDW8iEmpMBmaPON5mY30BXVR8mCySXQ
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-hardening@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
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



On 9/26/22 17:12, Mark Brown wrote:
> On Mon, Sep 26, 2022 at 04:40:55PM -0500, Gustavo A. R. Silva wrote:
>> Zero-length arrays are deprecated and we are moving towards adopting
>> C99 flexible-array members, instead. So, replace zero-length arrays
>> declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
>> helper macro.
>>
>> This helper allows for flexible-array members in unions.
> 
> As documented in submitting-patches.rst please send patches to the
> maintainers for the code you would like to change.  The normal kernel
> workflow is that people apply patches from their inboxes, if they aren't
> copied they are likely to not see the patch at all and it is much more
> difficult to apply patches.

That's exactly what I intended to do:

$ scripts/get_maintainer.pl --nokeywords --nogit --nogit-fallback include/sound/sof/control.h

Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)

Takashi Iwai <tiwai@suse.com> (maintainer:SOUND)

alsa-devel@alsa-project.org (moderated list:SOUND)

linux-kernel@vger.kernel.org (open list)

Did you see anything wrong with this or something...?

Thanks
--
Gustavo
