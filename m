Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A95261118
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 14:09:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C196172F;
	Tue,  8 Sep 2020 14:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C196172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599566956;
	bh=bhgK7eMJSmhutWCxXvIO23AQLdZfMdBiQAsGqJV7K0o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A74oeb5LsvLxPEWyEkLXZKkKXqHyf5gEipZ+/ZBbh9yKWizEeOOwuMgqIi83MEh70
	 MmoSF5r4zN7W7C41CcjP9Ulc9qE0q9xIO/svDMwGf9YYdbt90SnXh4Tq7IPU2eBnFG
	 orrMa5PZEl9H4mBDDaYb5QU4fckJYKP03PUmpLzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D0D0F800FD;
	Tue,  8 Sep 2020 14:07:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDCB6F801F2; Tue,  8 Sep 2020 14:07:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1915F8010B
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 14:07:26 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3D3EEA0049;
 Tue,  8 Sep 2020 14:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3D3EEA0049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1599566846; bh=LS1tspQNZeiW+c3AFuszS5oyvdkH2Pdm62xxJvtgfU8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=m4s2/YDCaBYRi7bdk4G/s4abyTWt71ZOimdap2NfUJM3cTnYebFwqkHczXwhd52HH
 hdQBhlBjz+P2HiK/G+lndxxyd520lIn6CgI/9XsC2tL10IKKBbV9WxEXK0CaXrJLu4
 VUkmvgt3TlNPG55e8nilhNqZ0x+m0oUb6rayGxpU=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  8 Sep 2020 14:07:09 +0200 (CEST)
Subject: Re: [PATCH 0/7] soundwire: filter out invalid PARITY errors
To: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org, 
 vkoul@kernel.org
References: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <e63f8306-ed00-3f53-cc72-abb9e6f0e5cc@perex.cz>
Date: Tue, 8 Sep 2020 14:07:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 bard.liao@intel.com, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 linux-kernel@vger.kernel.org
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

Dne 18. 08. 20 v 16:06 Bard Liao napsal(a):
> Some codecs may report fake PARITY errors in the initial state. This
> series will filter them out.
> 
> Pierre-Louis Bossart (7):
>   soundwire: bus: use property to set interrupt masks
>   soundwire: bus: filter-out unwanted interrupt reports
>   soundwire: slave: add first_interrupt_done status
>   soundwire: bus: use quirk to filter out invalid parity errors
>   ASoC: codecs: realtek-soundwire: ignore initial PARITY errors
>   soundwire: bus: export broadcast read/write capability for tests
>   soundwire: cadence: add parity error injection through debugfs
> 
>  drivers/soundwire/bus.c            | 93 ++++++++++++++++++++++++------
>  drivers/soundwire/bus.h            |  4 ++
>  drivers/soundwire/cadence_master.c | 86 +++++++++++++++++++++++++++
>  drivers/soundwire/slave.c          |  1 +
>  include/linux/soundwire/sdw.h      |  9 +++
>  sound/soc/codecs/max98373-sdw.c    |  3 +
>  sound/soc/codecs/rt1308-sdw.c      |  3 +
>  sound/soc/codecs/rt5682-sdw.c      |  5 ++
>  sound/soc/codecs/rt700-sdw.c       |  5 ++
>  sound/soc/codecs/rt711-sdw.c       |  5 ++
>  sound/soc/codecs/rt715-sdw.c       |  5 ++
>  sound/soc/codecs/wsa881x.c         |  1 +
>  12 files changed, 202 insertions(+), 18 deletions(-)
> 

I tested the changes and it works on my test system. The changes are straight.
For all:

Acked-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
