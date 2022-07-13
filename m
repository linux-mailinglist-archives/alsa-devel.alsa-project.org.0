Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 253C1573AC4
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 18:02:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B639A173E;
	Wed, 13 Jul 2022 18:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B639A173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657728153;
	bh=jxieoOyspIxcbvGgFQnEYr+DpFvvoawGmAQ9j7tPOxA=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t1nklnlx8rjFZG9TxKXDD2eVoHjmUyyM6oR4N/SrIkWKBEOhZe3dD+6OeRZYlJWq8
	 gllaWO2LxuHCvMnRucrdhbM0VyGzANDlBDumY1ZcnBu1hcbaGzJeqUBJJs7eWUK+tb
	 kOl97ZSyQRC0FYb2JQFRkuZBZiSDmV1ozbdEpwkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C8D8F80254;
	Wed, 13 Jul 2022 18:01:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45D99F80249; Wed, 13 Jul 2022 18:01:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from relay3.hostedemail.com (smtprelay0014.hostedemail.com
 [216.40.44.14])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E0C5F8012B
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 18:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E0C5F8012B
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay06.hostedemail.com (Postfix) with ESMTP id CFEA934F0C;
 Wed, 13 Jul 2022 16:01:22 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf18.hostedemail.com (Postfix) with ESMTPA id 16A9E34; 
 Wed, 13 Jul 2022 16:01:16 +0000 (UTC)
Message-ID: <75404573094d1c46172fcd51dad6a4e564da1542.camel@perches.com>
Subject: Re: [PATCH] soundwire: qcom: Update error prints to debug prints
From: Joe Perches <joe@perches.com>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, Pierre-Louis
 Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 agross@kernel.org,  bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org,  robh+dt@kernel.org, quic_plai@quicinc.com,
 bgoswami@quicinc.com, perex@perex.cz,  tiwai@suse.com,
 srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com, 
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org,  judyhsiao@chromium.org
Date: Wed, 13 Jul 2022 09:01:16 -0700
In-Reply-To: <8cde58d2-3b10-b88b-2d10-88e76fbcac06@quicinc.com>
References: <1657714921-28072-1-git-send-email-quic_srivasam@quicinc.com>
 <75e9b775-3bbe-0b34-2bd6-b4ac74620672@linux.intel.com>
 <8cde58d2-3b10-b88b-2d10-88e76fbcac06@quicinc.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 16A9E34
X-Stat-Signature: oamptbghkx51eutk1cq8n1rajg7frenc
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/ELQpropLow+VPSUREm5LEbTNOk8SYDOE=
X-HE-Tag: 1657728076-660807
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

On Wed, 2022-07-13 at 20:22 +0530, Srinivasa Rao Mandadapu wrote:
> On 7/13/2022 7:53 PM, Pierre-Louis Bossart wrote:
> Thanks for your time Pierre-Louis!!!
> >=20
> > On 7/13/22 07:22, Srinivasa Rao Mandadapu wrote:
> > > Upadte error prints to debug prints to avoid redundant logging in ker=
nel
> > update
[]
> > > diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
[]
> > > @@ -573,11 +573,10 @@ static irqreturn_t qcom_swrm_irq_handler(int ir=
q, void *dev_id)
> > >   				break;
> > >   			case SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED:
> > >   			case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
> > > -				dev_err_ratelimited(swrm->dev, "%s: SWR new slave attached\n",
> > > -					__func__);
> > > +				dev_dbg(swrm->dev, "%s: SWR new slave attached\n", __func__);

Could also drop the "%s: ", __func__ as it's already a unique message
and dynamic debug could add it back if really desired.

