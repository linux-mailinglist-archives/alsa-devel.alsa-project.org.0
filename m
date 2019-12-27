Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EB212BA49
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 19:17:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F2451742;
	Fri, 27 Dec 2019 19:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F2451742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577470661;
	bh=sGXFisSyu+gC1oDtxGhpit3dIGqQ9eLDs1Eu6Vupc3c=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g+K8lAxoV7Hem6cmnuDYZ02t0mtDkLNDdd1NGiGOiBUS7lZtvRKhw46ZiXor9E61Y
	 52TKD2sR2njP9AXfV+lkL0EZCf58I97ClvwWbqzDo7ynMKv4jTtmeF+a4SAhe9CeNE
	 8S99s6P0O/dzNZyVULmypzM8P8TVSUXSped+qitU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49E1CF800CD;
	Fri, 27 Dec 2019 19:15:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F295F80147; Fri, 27 Dec 2019 19:15:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4D1AF800CD
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 19:15:54 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A925EA0055;
 Fri, 27 Dec 2019 19:15:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A925EA0055
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1577470553; bh=ySOmZ+8azTykAyCVE/0pg1TD58i3W9JZpYQDC5k97Wc=;
 h=From:Subject:To:Cc:Date:From;
 b=XfnDZouWh6MSAJExPaUlwULIW0CU3afYAK8j0LNZJOTUtdei6Pc4VB1MVqHBf50rd
 ASFeJVuBUahD996wQ25QFpL5J2TvVGVg/Z0f3TisUaNR4KIuL3AcCsXobKqZq5tPsz
 ec3/Ga4MUDgmxA1OcsipWlDDnUEWLJnpFg6MtVQA=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 27 Dec 2019 19:15:48 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Message-ID: <2cae9b3c-8634-7aff-3d76-7a16b1807abf@perex.cz>
Date: Fri, 27 Dec 2019 19:15:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Language: en-US
Cc: "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>,
 Mengdong Lin <mengdong.lin@linux.intel.com>,
 Pan Xiuli <xiuli.pan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] topology file broadwell.conf
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,

	I am working on some (major) cleanups for the topology library and I hit the 
issue with the topology file broadwell.conf in upstream. It cannot be compiled 
with the latest alsatplg / libatopology, because the SectionPCMConfig was 
removed in commit 368e4f2a897b5500573a2ee525f5504c135cfca2 in alsa-lib.
	Which driver is using this topology in the current linux kernel?

					Thanks,
						Jaroslav	

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
