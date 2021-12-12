Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9519F4719BF
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 12:18:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA0031AE3;
	Sun, 12 Dec 2021 12:17:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA0031AE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639307903;
	bh=KBPylguxArlp8mJjoUAVRH+pRiOHF46AxN88AadLba8=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fmjhR0ri2wvEQU1SveQA1OXTO/QWTzISynt9S8P/NxzOV4LTtiirFqdDC4ZOOLwSy
	 ffMP9mwtdxvOoPCmBjvmNAqEDspcEy21sYS3NSbPLNytKMUH8w+aRDpCT0Z2X/YxH9
	 hWMEWRCgXJI3/ZZIWBKABARkSy+gx5054NcAcuX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 612B3F80059;
	Sun, 12 Dec 2021 12:17:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99EF7F80246; Sun, 12 Dec 2021 12:17:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mailrelay1.jaist.ac.jp (mailrelay1.jaist.ac.jp
 [IPv6:2001:df0:2ed:8200::22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4189F80161
 for <alsa-devel@alsa-project.org>; Sun, 12 Dec 2021 12:17:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4189F80161
IronPort-SDR: w2nJURXNVAF0hWvf4wfGu+CdR6TWWZaLnRgxUgOFbLik0lUaC7DP+dGewLbko6BwJWG64pH4PP
 WpudqkVLdZZ0xRAYHZcATZTrbgenYjfvBXJMH1VedmUjzRaUERdyDSfgVQbx7+z4eWg3K4/9CX
 0SJd3hC8QcKukXkEyOZjnycPxZaLa3tkAnf0mMxJYah7sdjGSz0IhPCUbvRz/jmwglFAaBXW5r
 VjF/T/AVCH3AUuXyTpjv/X4z03zTAoZBg655n9GvKzsTpNLqMcGlbiJpIAVNZXxId12UPR0cGF
 h5w=
X-IPAS-Result: =?us-ascii?q?A+HtBADc2bVh/4d6BCSPi4OGAIbX/IAAoAtagQmBWYFSA?=
 =?us-ascii?q?SuBfoUziQOHYpE9hQiILgIJAQEBTQECBAEBiCsmNwYOAQIEAQEBAQMCAwEBB?=
 =?us-ascii?q?wEBAQUBAQEBAQEFAwECAoEYhS+HOxVZEA0CJgJfDQgBAYJtgxmwdIExGmeEa?=
 =?us-ascii?q?4JwJU2BLIEQKo51gg2BPAwDiw+CZQSSboMfjlUHkxFenWmDSoQCmxEGDwUug?=
 =?us-ascii?q?12RNYEWA5ElliymfoFCgX8zGggwgyVQj24BCI0wMmsCBgsBAQMJhUQIARUIE?=
 =?us-ascii?q?gEKAYpoAQE?=
IronPort-Data: A9a23:39TD0KP88ospYxrvrR0YlcFynXyQoLVcMsEvi/4bfWQNrUp2hjEAz
 GtOX2HQP/2NNDGmLd8gaI+/8UxQusXRnYdmHgZtpSBmQlt08seUXt7xwmUcn8+xwmwvaGo9s
 q3yv/GZdJhcokcxJ35BC5C5xZVG/fjgqoHUVaiUakideSc+EH140Eg6wbZg6mJVqYHR7z2l6
 IOaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkGE2EByCQrr+4vgKNb
 72rILmRpgs19vq2Yz+vuu6TnkYiGtY+MeUS45b/tmfLbhVq/0QPPqgH2PU0TUhpsBOmhf1Nj
 /53useoFVsON4uSh7FIO/VYO3kW0axuy57/Hybt65DLkx+Zeiuzkfs3UhlkNtZAorQpCG9Ap
 65BcGgHW3hvhcrsnOrnGLZl1ptxIpC1ZNEU4Sk4n2/QA/h0E8mbG6+iCdxwhV/cguhVGP/EZ
 s0CQThmbQ/cJRREfFUPYH47tLz43yKgI2IwRFS9iu0x42Xw6AxI/5PpOvjZPdWAX5hwtxPNz
 o7B1yGjav0AD/SWzSGMt36hmOLLtSr/Q4tXDKe/9PNhnBuU3GN7NfENfQHn+aXr1UfuBIBRc
 hJMqCF19fBgqkWlQIuvBkXgqhZooyIhZjaZKMVigCnl90Yey1/x6rQsJtKZVOEbiQ==
IronPort-HdrOrdr: A9a23:Azb1dqqki5d7QNrRsBNFTN8aV5o0eYIsimQD101hICG9Afb2qy
 nIpoV46faUskdzZJhOo7q90cW7IE80lqQZ3WByB9yftWDd0QOVxepZjbcKrQePJ8SzzIJg6Z
 s=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.88,200,1635174000"; 
   d="scan'208";a="3813787"
Received: from unknown (HELO [IPV6:2404:7a87:f160:c300:6aff::100b])
 ([IPv6:2404:7a87:f160:c300:6aff::100b])
 by mailrelay1.jaist.ac.jp with ESMTP; 12 Dec 2021 20:16:57 +0900
Message-ID: <2a4907ee-96d2-9969-de47-80b77b7444d1@jaist.ac.jp>
Date: Sun, 12 Dec 2021 20:16:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: alsa <alsa-devel@alsa-project.org>
From: Marios Sioutis <smarios@jaist.ac.jp>
Subject: S24LE and S32LE format equivalency
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi all,

Quick question, I was troubleshooting a 24bit USB device and got down 
the rabbit hole of sample formats. The device advertises itself as S24LE 
(4byte payload) but it appears as S32LE under alsa, something that 
bothered me a lot initially. However, If the conversion between the two 
formats is to just << 8 i.e. put a zero byte as LSB, then the two 
formats are essentially equivalent.

Is this actually the case? If yes, who performs the conversion? Is it on 
the alsa side, or the device already adds a zero byte LSB?

Thank you in advance,

Marios

