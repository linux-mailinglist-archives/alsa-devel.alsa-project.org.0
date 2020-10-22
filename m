Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8407295626
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 03:47:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72A8B1779;
	Thu, 22 Oct 2020 03:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72A8B1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603331237;
	bh=nF8pbRC3J5x9VW/1aGWO/qnpqlBb5LO57OhCCMs9XKg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YvOj4J5ubAtlEI0WoAFQ9bd9hPLLICmZY+asvjUXlMQSnbhitNzT3tusrJuwzP44L
	 FIH6sQu142a22JJJp11PaCQPzF63W3vVJmEqKN4vzgUXsihZhSvz7mxqzqx6pLbxQ/
	 SKj9J31SjkN5Mu80+tgCvaL4QCJ2rbthd6Ou7/FU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05FACF804AA;
	Thu, 22 Oct 2020 03:45:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B095F804A9; Thu, 22 Oct 2020 03:45:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10B1AF8025A
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 03:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10B1AF8025A
Received: from 1.general.hwang4.uk.vpn ([10.172.195.16])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kVPfc-0003yb-CZ; Thu, 22 Oct 2020 01:45:37 +0000
Subject: Re: [bug report] ALSA: hda - Don't register a cb func if it is
 registered already
To: Takashi Iwai <tiwai@suse.de>
References: <20201021121904.GA1126544@mwanda>
 <da806361-d1a8-ce20-462f-0ec6acff5bfc@canonical.com>
 <9be5bc31-0118-1542-560f-cfe2cecf2403@canonical.com>
 <s5hblgvefix.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <c36f69e9-fea8-bf8c-4568-892e75bc179c@canonical.com>
Date: Thu, 22 Oct 2020 09:45:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hblgvefix.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Dan Carpenter <dan.carpenter@oracle.com>
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


On 10/21/20 11:59 PM, Takashi Iwai wrote:
> On Wed, 21 Oct 2020 17:03:11 +0200,
> Hui Wang wrote:
>> Looks like this will not bring problem on patch_sigmatel.c, NULL and
>> valid kernel pointer are same for IS_ERR(), they will not make
>> IS_ERR() come true.
> Right, and it's called only once, so the bug doesn't hit.
>
> But we should address the potential bug nevertheless, of course :)

OK, will fix it.

Thanks.

>
> thanks,
>
> Takashi
