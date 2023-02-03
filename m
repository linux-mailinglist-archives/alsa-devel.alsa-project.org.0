Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C498689A24
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 14:51:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9928382E;
	Fri,  3 Feb 2023 14:50:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9928382E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675432274;
	bh=/G99ARz+TxRAUHqEr+rhmmkUZFrTkphKOmFmBgk5gt8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=e46pPndDpVUJSlYUAbj2aBxrylSfT1/RTpb4Cb1snTl6FNrZ+DeaxzKYzz/oqyYEO
	 WVwQad0Lps/KwJ3rOLJjqPxOkIrWtqyekkvrQMKiOBEhcdKZa6eC5VleQw2phK/lha
	 vajDidOaeyIg33ZamWQZCvuzljgpOs+fz2gsHQsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6617F80169;
	Fri,  3 Feb 2023 14:50:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB698F8047D; Fri,  3 Feb 2023 14:50:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,T_SPF_TEMPERROR,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from omta039.useast.a.cloudfilter.net
 (omta039.useast.a.cloudfilter.net [44.202.169.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22AE2F80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 14:50:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22AE2F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=TfEx5Vjd
Received: from eig-obgw-5012a.ext.cloudfilter.net ([10.0.29.230])
 by cmsmtp with ESMTP
 id NlFlp5JxmJlHBNwS3pklKq; Fri, 03 Feb 2023 13:50:03 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTP
 id NwS1poUCMVwooNwS1po4Eq; Fri, 03 Feb 2023 13:50:01 +0000
X-Authority-Analysis: v=2.4 cv=DaIEF9hW c=1 sm=1 tr=0 ts=63dd1109
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=wTog8WU66it3cfrESHnF4A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10 a=m04uMKEZRckA:10
 a=wYkD_t78qR0A:10 a=7T_mhvgX4LM0xDefXN8A:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nfvZ96BrG5fGeqbIzSxz3kPTSkmeAy6LnZ8/UueNOmo=; b=TfEx5VjdpDytiqvVkfKzqhmyig
 GT8JecRLWYtUwnOTw2twgiuRm4WC9U94X6fKQ1Yj7XwOm37pRHOjFxrildsuKtE+4qJic4gh4rnPs
 67jyNrATMKJ0yjuWzcAC2S4ZCAhekqCT8jlcHpD+a1LUvsEgCbaAWB0Y6xRcBp/RiU3ZTcEVYbiYb
 GErA6TjebKlZ1du/teXeLfRQQdOt2rEUAuDXf35t3Eu7LW0V38WphXHgzrN8RYxrjzP3BBDm4OvWQ
 3c9m4CD16oI9nYCrgVKYx0kM1J2eGyoHKotqxPMu7/F8FS9wMNPa2ca7SLGcXTpuUWEAwa9OOWolS
 LXP8+kqw==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:53588
 helo=[192.168.15.7])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <gustavo@embeddedor.com>) id 1pNwS0-003U2j-P0;
 Fri, 03 Feb 2023 07:50:00 -0600
Message-ID: <0dad546c-203a-062c-8922-54d506529cd7@embeddedor.com>
Date: Fri, 3 Feb 2023 07:50:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH][next] ASoC: uapi: Replace zero-length arrays with
 __DECLARE_FLEX_ARRAY() helper
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <YzIzUjUuJKf0mkKg@work>
 <fcd83e77-a3fb-9061-771a-8509ea6f5950@embeddedor.com>
 <Y9wmnfTi/p4FuRmd@sirena.org.uk>
 <bb43c410-bd8c-66fe-19a1-0f41442838eb@embeddedor.com>
 <Y90ExljX2qCsowhu@sirena.org.uk>
 <652684af-bd10-99da-1ed8-104407493428@embeddedor.com>
 <Y90P3kik6ONZg3U4@sirena.org.uk>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <Y90P3kik6ONZg3U4@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1pNwS0-003U2j-P0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.7])
 [187.162.31.110]:53588
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 10
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI69i8X3viDdYT5RZPw1OFzkh+w/YAkdWm/dpjoLA0Pcr/qjU4o+z+18yLl0AbHwHBxQIEuLu2EihC/ywj3unl8gi5WZjaV7n3CDSaLhrGv0b++GI69J
 2ePVrFF1j0Jj18KWJJxoQKi9NG7zoSCGgn/qNaQS3J7gqGUi90c1+cJnvXXzZu1YLIsWn3UIdzEhWb9Vj+8JbSDeBgi5Viqp/jCIGDqJaPBNI/6vZqEFCBuY
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-hardening@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 2/3/23 07:45, Mark Brown wrote:
> On Fri, Feb 03, 2023 at 07:27:03AM -0600, Gustavo A. R. Silva wrote:
> 
>> I think we have run into this same issue (you not being listed in the
>> MAINTAINERS file) at least once in the past, right? (thinkingface)
> 
>> IMHO, the sensible solution for this is to keep the MAINTAINERS file
>> up-to-date. So, get_maintainer.pl can continue to be useful for people.
> 
> Sure, feel free to send an update...

[chuckles]
