Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8FB158119
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 18:16:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A1C61664;
	Mon, 10 Feb 2020 18:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A1C61664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581354988;
	bh=XMuWVgvUlStGW6mAJNPtaF/dEeVXKoc0QPlrl6DYIqo=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AtrAya0RLQLb/GA+1kgaeCwk/SrfM/fVy8dl4jUBGiYTQ/5JlvcGzozIz2KduG31b
	 +tIiv0/KLkdFOSwOs6+uv3DYCYqiXnaw/Y+EB8KHovzipGSPgcPpHa0Sg9Km70irO6
	 vpBCw0181ygrVKcXtp0EH78t4awpzJ2CwPd7D8xE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A54AF80240;
	Mon, 10 Feb 2020 18:13:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC14FF80257; Mon, 10 Feb 2020 18:13:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.serbinski.com (mail.serbinski.com [162.218.126.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25E9CF80234
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 18:13:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25E9CF80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=serbinski.com header.i=@serbinski.com
 header.b="hVuMwRTg"
Received: from localhost (unknown [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 4B3FFD006F9;
 Mon, 10 Feb 2020 17:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
 by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y9dGI62t9Mvd; Mon, 10 Feb 2020 12:13:45 -0500 (EST)
Received: from mail.serbinski.com (localhost [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 948F0D00693;
 Mon, 10 Feb 2020 12:13:45 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 948F0D00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
 s=default; t=1581354825;
 bh=eF+04ZGVf2fJiXEo3RLvJAFtKWhdL+MG4jKGtRigICU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hVuMwRTgIWnWwKzt6Cz31jCiTwi7QV7Rk7KLz2N5ck5Ukj7WM5pb+LUqtXFJZg7fD
 8bdluM5+H0bY0iXDyaNj9AZQUQyPyvOiK/au/Y10dtGmAn0schtMFxCmjoVr+l6Yo4
 s3HCE95Fl8eNYhKKBNIlPQOFheoC5u4KKPwFgZcw=
MIME-Version: 1.0
Date: Mon, 10 Feb 2020 12:13:45 -0500
From: Adam Serbinski <adam@serbinski.com>
To: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <317edce5-a982-549b-84c2-84cdc1d92c9a@perex.cz>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-9-adam@serbinski.com>
 <317edce5-a982-549b-84c2-84cdc1d92c9a@perex.cz>
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <16297aae0c0c330b7b48150eae512e32@serbinski.com>
X-Sender: adam@serbinski.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 8/8] ASoC: qcom: apq8096: add kcontrols
	to set PCM rate
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

On 2020-02-10 11:18, Jaroslav Kysela wrote:
> Dne 09. 02. 20 v 16:47 Adam Serbinski napsal(a):
>> This makes it possible for the backend sample rate to be
>> set to 8000 or 16000 Hz, depending on the needs of the HFP
>> call being set up.
> 
> Two points:
> 
> Why enum? It adds just more code than the integer value handlers.

Because enum allows the potential values to be restricted to a set of 
distinct values rather than a range. And while yes, I understand that 
the value can be validated, or the step can in this case be set to 
correspond to the difference between the current 2 values, this approach 
would neither make it clear to the user what the permitted values are, 
nor would it scale well once additional values are required.


> Also, this belongs to the PCM interface, so it should be handled with
> SNDRV_CTL_ELEM_IFACE_PCM not mixer.
> 
> The name should be probably "Rate" and assigned to the corresponding 
> PCM device.
> 
> Add this to Documentation/sound/designs/control-names.rst .

Above 3 lines are noted, I will make these changed.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
