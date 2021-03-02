Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9982732A903
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 19:12:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2649518ED;
	Tue,  2 Mar 2021 19:11:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2649518ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614708722;
	bh=qOffbnaZLP84O32CDGfhkFCvHOsL4p8F5h6kNZrioTU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MK0fNU+CBI8fLoIQeeHiXssAfdpGcB78vsccICWb0BJ+HpjfgBTuJedj45KFLvX46
	 8gH62JJmuYQ0uvHAD+YHwbxPqNU1ylDo91pjsShl5kYyPbz90HEXMxjLIwzU+ESuS5
	 yI+wJQ7t2GSMTubhjiiGB2GT3AF2oFA7o5ze2Rm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E1BAF80088;
	Tue,  2 Mar 2021 19:10:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7605F80269; Tue,  2 Mar 2021 19:10:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1EA3F8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 19:10:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1EA3F8012D
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 30970C800CF;
 Tue,  2 Mar 2021 19:10:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id HfZ0oyAHYEuv; Tue,  2 Mar 2021 19:10:25 +0100 (CET)
Received: from [IPv6:2003:e3:7f23:4700:cc41:88a7:f2f8:d6b8]
 (p200300E37f234700Cc4188a7f2F8D6B8.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f23:4700:cc41:88a7:f2f8:d6b8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id D7010C800CE;
 Tue,  2 Mar 2021 19:10:24 +0100 (CET)
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Clevo NH55RZQ
To: Takashi Iwai <tiwai@suse.de>
References: <0eee6545-5169-ef08-6cfa-5def8cd48c86@tuxedocomputers.com>
 <s5hmtvlea00.wl-tiwai@suse.de>
From: Werner Sembach <wse@tuxedocomputers.com>
Autocrypt: addr=wse@tuxedocomputers.com; keydata=
 mDMEX6ALvhYJKwYBBAHaRw8BAQdAG/kE3mlbV1YLpCU8iA7Pyq2eDq9LxzGQxcOZODh2Vnq0
 KFdlcm5lciBTZW1iYWNoIDx3c2VAdHV4ZWRvY29tcHV0ZXJzLmNvbT6IlgQTFggAPhYhBNzq
 jJqAsvWKK1h7bi7eQpXUvijKBQJfoAu+AhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMBAh4B
 AheAAAoJEC7eQpXUvijKzkEA/jblmQRWU/e18oo8J9GPHWOCRUA1WJLUt9lSye5cgl2vAP0Y
 q+EpkDRS+QqtIcIr3fVELwA4b/V1lVE2LW+plcmdCbg4BF+gC74SCisGAQQBl1UBBQEBB0Bc
 k3J9DVAB4ysrdDcKE7L9iAUjlWD+rsLh/5soPORqFQMBCAeIfgQYFggAJhYhBNzqjJqAsvWK
 K1h7bi7eQpXUvijKBQJfoAu+AhsMBQkJZgGAAAoJEC7eQpXUvijKBBYA/2DT2g26dpTU2Rbc
 lqviltu+woGZCd0GBfRgXuzUK0OfAQCwr8qPCl8uIsBgOsDmWIJYByG2ddwmXiAgBS1985bM Ag==
Message-ID: <92e33367-f20a-3f7b-94be-ebe54a1bf9e1@tuxedocomputers.com>
Date: Tue, 2 Mar 2021 19:10:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hmtvlea00.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

> Thanks, now I could apply it.
Missed your reply: I have now sent it a third time using git send-email.
One change: I added Cc: stable this time.
> Could you resubmit the NUC10 patch as well? Takashi 
Done.
Hope everything is correct now.
