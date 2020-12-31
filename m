Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6A72E7F32
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 11:07:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B910F16BD;
	Thu, 31 Dec 2020 11:06:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B910F16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609409215;
	bh=h6RA8d3DUY9hWJeGWMAzZaZ6ADTNPhMGGqtODAnZ2/c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p60Vv2EMsIr+7e1glgDX7L0Mhy4/fQyh6Jmsj2UjGyhGTBV8FHK3Rfa1nmeLdOou1
	 e+y40/eHFpA+kwlfZLTU1l28QmlIR3O3UOwxW2E7OCQXDDSxc37nX5wRfYHjM1qBJS
	 DB2WN+IOeVRTGlhWRGjGU1eSHFmOyaSTHL7j8QW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 148EBF8020C;
	Thu, 31 Dec 2020 11:05:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37505F8022B; Thu, 31 Dec 2020 11:05:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4CE4F8015F
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 11:05:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4CE4F8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="CR0YduAI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=U8meFnagSx5UoL6OkuHCQ1qYQXyfGOujKQn9JkRkgxw=; b=CR0YduAIqGTPqs/+Eg6L34JJbN
 lOFf8cyjDV/koo3PRttFyvepYh0Tb5/tJC4rWs5ER/UYsh4EXSdN7b4eDlHjGHwYh7lBs5lViZkhQ
 jmFWTfsmjmphTQ3I3XByjIHE4ouiKbCw5ZOxhVUfzkXB0Ee0khLgMS9jb6wC5B1nbybqH/0Zm96Au
 vdUfMHKdokQkhRFtn2XZKxTRYyGHWjRJs0qvcHDoEHtxyN8uuWabZafwp/30AD5qLQ9euBrnzqErh
 wk0uk22x0spmdfOdKPOzJYsv8kypz3nbAKfEqKZgIeH9Ud0QpPKAwIJJc92TyatwNmNuChB8DBFqn
 9TpqE4LQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kuupB-0006d6-Af; Thu, 31 Dec 2020 11:04:53 +0100
Received: from [2001:a61:2af4:a201:9e5c:8eff:fe01:8578]
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kuupB-0007li-3g; Thu, 31 Dec 2020 11:04:53 +0100
Subject: Re: Haswell audio no longer working with new Catpt driver (was: sound)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Labisch <clnetbox@gmail.com>
References: <2f0acfa1330ca6b40bff564fd317c8029eb23453.camel@gmail.com>
 <efc6d5e8abc1da3cac754cb760fff08a1887013b.camel@gmail.com>
 <X+2MzJ7bKCQTRCd/@kroah.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <a194639e-f444-da95-095d-38e07e34f72f@metafoo.de>
Date: Thu, 31 Dec 2020 11:04:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <X+2MzJ7bKCQTRCd/@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26033/Wed Dec 30 13:42:10 2020)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Akemi Yagi <toracat@elrepo.org>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Greg Kroah-Hartman <stable@vger.kernel.org>,
 Greg Kroah-Hartman <linux-kernel@vger.kernel.org>,
 Justin Forbes <jforbes@redhat.com>
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

On 12/31/20 9:33 AM, Greg Kroah-Hartman wrote:
> On Wed, Dec 30, 2020 at 07:10:16PM +0100, Christian Labisch wrote:
>> Update :
>>
>> I've just tested the kernel 5.10.4 from ELRepo.
>> Unfortunately nothing changed - still no sound.
> Ah, sad.  Can you run 'git bisect' between 5.9 and 5.10 to determine the
> commit that caused the problem?

The problem is that one driver was replaced with another driver. git 
bisect wont really help to narrow down why the new driver does not work.

Christian can you run the alsa-info.sh[1] script on your system and send 
back the result?

You say sound is not working, can you clarify that a bit? Is no sound 
card registered? Is it registered but output stays silent?

- Lars

[1] https://www.alsa-project.org/wiki/AlsaInfo 
<https://www.alsa-project.org/wiki/AlsaInfo>


