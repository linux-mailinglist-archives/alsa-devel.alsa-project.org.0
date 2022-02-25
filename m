Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4752A4C5028
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:54:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3D941F66;
	Fri, 25 Feb 2022 21:53:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3D941F66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645822484;
	bh=nZRl1IdScLlx70eZns4jGZmPBP3F7NdUCSJLJUQzNKM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HqJQXHxZKNTVV0aovjvS5P1553gUVMQN7vzAxcJ/AqlMzdMnVHnYxhbn50dAeB068
	 2Obllzxuggr3LbfbqIow3E+Ctna4uxnpn1YSbRFRPEM1LE6DjDhcAhYq+ap9gZhQFn
	 12eHQ4GKQl+Z4PVXQ3YFhsdFDopb7Q50j9XP1imI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B595BF80519;
	Fri, 25 Feb 2022 21:52:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D44E5F804FD; Fri, 25 Feb 2022 21:52:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24F49F80118
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:52:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24F49F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AKyotpZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645822352; x=1677358352;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nZRl1IdScLlx70eZns4jGZmPBP3F7NdUCSJLJUQzNKM=;
 b=AKyotpZgImdYudPdjUvqibJ2pdgIGFwlws4OMR8nFDgHt+j3H+huz3CF
 iefzkO0qE8v1R5FeuQLx+cLloCv5w773KvJ2aArIgp2H+uc+NK+dE8DQL
 fMF7nsBNxA20skj20fc7hencdyx+ShG/QSDFFAglisQZJ3ehyIi30b6BP
 XIo60YR7bIlzRGS17qXyBVBrP8IzmVFVpcoKW2qIjYUcQx6mL6/bHSoV3
 IRNFKPPZP8BM4NQW7l4NG1n3nGwfkobcizRHpuF0oxHbBmYNH9ySDW0F7
 8jzmARwEI8sgwoh66rSJ+lPFBUCd9u8xUxbq8qcqVwdV3ojFmIs7A1JqU Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313296117"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="313296117"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:27 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="777520521"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:25 -0800
Message-ID: <6cdb5477-38d6-8308-2ff8-3bed61fdfb3e@linux.intel.com>
Date: Fri, 25 Feb 2022 11:20:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [RFC 02/13] ASoC: Intel: avs: Add topology parsing infrastructure
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-3-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207132532.3782412-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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



On 2/7/22 07:25, Cezary Rojewski wrote:
> AVS topology is split into two major parts: dictionaries - found within
> ASoC topology manifest - and path templates - found within DAPM widget

what is a "path template"? this is the third time I review your patches
and I have yet to find a description of all this.

If you introduce a new concept you really need to explain what problem
you are trying to solve, why it's important and what other alternatives
could be considered. Consider adding a Documentation file to explain
what you are trying to accomplish.

Jumping to optimizations of memory footprint through dictionaries is too
early.

> private data. Dictionaries job is to reduce the total amount of memory
> occupied by topology elements. Rather than having every pipeline and
> module carry its own information, each refers to specific entry in
> specific dictionary by provided (from topology file) indexes. In
> consequence, most struct avs_tplg_xxx are made out of pointers.
> To support the above, range of parsing helpers for all value-types known
> to ALSA: uuid, bool, byte, short, word and string are added. Additional
> handlers help translate pointer-types and more complex objects such as
> audio formats and module base configs.
> 
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/avs/avs.h      |  14 +
>  sound/soc/intel/avs/topology.c | 595 +++++++++++++++++++++++++++++++++
>  sound/soc/intel/avs/topology.h |  44 +++
>  3 files changed, 653 insertions(+)
>  create mode 100644 sound/soc/intel/avs/topology.c
>  create mode 100644 sound/soc/intel/avs/topology.h
> 
> diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
> index 20987c7744a3..61842720c894 100644
> --- a/sound/soc/intel/avs/avs.h
> +++ b/sound/soc/intel/avs/avs.h
> @@ -13,10 +13,12 @@
>  #include <linux/firmware.h>
>  #include <sound/hda_codec.h>
>  #include <sound/hda_register.h>
> +#include <sound/soc-component.h>
>  #include "messages.h"
>  #include "registers.h"
>  
>  struct avs_dev;
> +struct avs_tplg;
>  
>  struct avs_dsp_ops {
>  	int (* const power)(struct avs_dev *, u32, bool);
> @@ -223,4 +225,16 @@ int avs_hda_load_library(struct avs_dev *adev, struct firmware *lib, u32 id);
>  int avs_hda_transfer_modules(struct avs_dev *adev, bool load,
>  			     struct avs_module_entry *mods, u32 num_mods);
>  
> +/* Soc component members */
> +
> +struct avs_soc_component {
> +	struct snd_soc_component base;
> +	struct avs_tplg *tplg;
> +
> +	struct list_head node;
> +};
> +
> +#define to_avs_soc_component(comp) \
> +	container_of(comp, struct avs_soc_component, base)
> +
>  #endif /* __SOUND_SOC_INTEL_AVS_H */
> diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
> new file mode 100644
> index 000000000000..4b8b415ca006
> --- /dev/null
> +++ b/sound/soc/intel/avs/topology.c
> @@ -0,0 +1,595 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright(c) 2021 Intel Corporation. All rights reserved.
> +//
> +// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
> +//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
> +//
> +
> +#include <linux/uuid.h>
> +#include <sound/soc.h>
> +#include <sound/soc-acpi.h>
> +#include <sound/soc-topology.h>
> +#include <uapi/sound/intel/avs/tokens.h>
> +#include "avs.h"
> +#include "topology.h"
> +
> +/* Get pointer to vendor array at the specified offset. */
> +#define avs_tplg_vendor_array_at(array, offset) \
> +	((struct snd_soc_tplg_vendor_array *)((u8 *)array + offset))
> +
> +/* Get pointer to vendor array that is next in line. */
> +#define avs_tplg_vendor_array_next(array) \
> +	(avs_tplg_vendor_array_at(array, le32_to_cpu((array)->size)))
> +
> +/*
> + * Scan provided block of tuples for the specified token. If found,
> + * @offset is updated with position at which first matching token is
> + * located.
> + *
> + * Returns 0 on success, -ENOENT if not found and error code otherwise.
> + */
> +static int
> +avs_tplg_vendor_array_lookup(struct snd_soc_tplg_vendor_array *tuples,
> +			     u32 block_size, u32 token, u32 *offset)
> +{
> +	u32 pos = 0;
> +
> +	while (block_size > 0) {
> +		struct snd_soc_tplg_vendor_value_elem *tuple;
> +		u32 tuples_size = le32_to_cpu(tuples->size);
> +
> +		if (tuples_size > block_size)
> +			return -EINVAL;
> +
> +		tuple = tuples->value;
> +		if (le32_to_cpu(tuple->token) == token) {
> +			*offset = pos;
> +			return 0;
> +		}
> +
> +		block_size -= tuples_size;
> +		pos += tuples_size;
> +		tuples = avs_tplg_vendor_array_next(tuples);
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +/*
> + * See avs_tplg_vendor_array_lookup() for description.
> + *
> + * Behaves exactly like its precursor but starts from the next vendor
> + * array in line. Useful when searching for the finish line of an
> + * arbitrary entry in a list of entries where each is composed of
> + * several vendor tuples and a specific token marks the beginning of
> + * a new entry block.

please try and reword such comments for people who didn't take part in
the development.

I really have no idea what this is about.

> + */
> +static int
> +avs_tplg_vendor_array_lookup_next(struct snd_soc_tplg_vendor_array *tuples,
> +				  u32 block_size, u32 token, u32 *offset)
> +{
> +	u32 tuples_size = le32_to_cpu(tuples->size);
> +	int ret;
> +
> +	if (tuples_size > block_size)
> +		return -EINVAL;
> +
> +	tuples = avs_tplg_vendor_array_next(tuples);
> +	block_size -= tuples_size;
> +
> +	ret = avs_tplg_vendor_array_lookup(tuples, block_size, token, offset);
> +	if (!ret)
> +		*offset += tuples_size;
> +	return ret;
> +}
> +
> +/*
> + * Scan provided block of tuples for the specified token which marks
> + * the boarder of an entry block. Behavior is similar to

boarder looks like a typo. Did you mean border? boundary? position?
location?

> + * avs_tplg_vendor_array_lookup() except 0 is also returned if no
> + * matching token has been found. In such case, returned @size is
> + * assigned to @block_size as the entire block belongs to the current
> + * entry.
> + *
> + * Returns 0 on success, error code otherwise.
> + */
> +static int
> +avs_tplg_vendor_entry_size(struct snd_soc_tplg_vendor_array *tuples,
> +			   u32 block_size, u32 entry_id_token, u32 *size)
> +{
> +	int ret;
> +
> +	ret = avs_tplg_vendor_array_lookup_next(tuples, block_size, entry_id_token, size);
> +	if (ret == -ENOENT) {
> +		*size = block_size;
> +		ret = 0;
> +	}
> +
> +	return ret;
> +}
> +
> +/*
> + * Vendor tuple parsing descriptor.
> + *
> + * @token: vendor specific token that identifies tuple
> + * @type: tuple type, one of SND_SOC_TPLG_TUPLE_TYPE_XXX
> + * @offset: offset of a struct's field to initialize
> + * @parse: parsing function, extracts and assigns value to object's field
> + */
> +struct avs_tplg_token_parser {
> +	enum avs_tplg_token token;
> +	u32 type;
> +	u32 offset;
> +	int (*parse)(struct snd_soc_component *comp, void *elem, void *object, u32 offset);
> +};
> +
> +static int
> +avs_parse_uuid_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
> +{
> +	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
> +	guid_t *val = (guid_t *)((u8 *)object + offset);
> +
> +	guid_copy((guid_t *)val, (const guid_t *)&tuple->value);
> +
> +	return 0;
> +}
> +
> +static int
> +avs_parse_bool_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
> +{
> +	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
> +	bool *val = (bool *)((u8 *)object + offset);
> +
> +	*val = le32_to_cpu(tuple->value);
> +
> +	return 0;
> +}
> +
> +static int
> +avs_parse_byte_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
> +{
> +	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
> +	u8 *val = ((u8 *)object + offset);
> +
> +	*val = le32_to_cpu(tuple->value);
> +
> +	return 0;
> +}
> +
> +static int
> +avs_parse_short_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
> +{
> +	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
> +	u16 *val = (u16 *)((u8 *)object + offset);
> +
> +	*val = le32_to_cpu(tuple->value);
> +
> +	return 0;
> +}
> +
> +static int
> +avs_parse_word_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
> +{
> +	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
> +	u32 *val = (u32 *)((u8 *)object + offset);
> +
> +	*val = le32_to_cpu(tuple->value);
> +
> +	return 0;
> +}
> +
> +static int
> +avs_parse_string_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
> +{
> +	struct snd_soc_tplg_vendor_string_elem *tuple = elem;
> +	char *val = (char *)((u8 *)object + offset);
> +
> +	snprintf(val, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s", tuple->string);
> +
> +	return 0;
> +}
> +
> +static int avs_parse_uuid_tokens(struct snd_soc_component *comp, void *object,
> +				 const struct avs_tplg_token_parser *parsers, int count,
> +				 struct snd_soc_tplg_vendor_array *tuples)
> +{
> +	struct snd_soc_tplg_vendor_uuid_elem *tuple;
> +	int ret, i, j;
> +
> +	/* Parse element by element. */
> +	for (i = 0; i < le32_to_cpu(tuples->num_elems); i++) {
> +		tuple = &tuples->uuid[i];
> +
> +		for (j = 0; j < count; j++) {
> +			/* Ignore non-UUID tokens. */
> +			if (parsers[j].type != SND_SOC_TPLG_TUPLE_TYPE_UUID ||
> +			    parsers[j].token != le32_to_cpu(tuple->token))
> +				continue;
> +
> +			ret = parsers[j].parse(comp, tuple, object, parsers[j].offset);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int avs_parse_string_tokens(struct snd_soc_component *comp, void *object,
> +				   const struct avs_tplg_token_parser *parsers, int count,
> +				   struct snd_soc_tplg_vendor_array *tuples)
> +{
> +	struct snd_soc_tplg_vendor_string_elem *tuple;
> +	int ret, i, j;
> +
> +	/* Parse element by element. */
> +	for (i = 0; i < le32_to_cpu(tuples->num_elems); i++) {
> +		tuple = &tuples->string[i];
> +
> +		for (j = 0; j < count; j++) {
> +			/* Ignore non-string tokens. */
> +			if (parsers[j].type != SND_SOC_TPLG_TUPLE_TYPE_STRING ||
> +			    parsers[j].token != le32_to_cpu(tuple->token))
> +				continue;
> +
> +			ret = parsers[j].parse(comp, tuple, object, parsers[j].offset);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int avs_parse_word_tokens(struct snd_soc_component *comp, void *object,
> +				 const struct avs_tplg_token_parser *parsers, int count,
> +				 struct snd_soc_tplg_vendor_array *tuples)
> +{
> +	struct snd_soc_tplg_vendor_value_elem *tuple;
> +	int ret, i, j;
> +
> +	/* Parse element by element. */
> +	for (i = 0; i < le32_to_cpu(tuples->num_elems); i++) {
> +		tuple = &tuples->value[i];
> +
> +		for (j = 0; j < count; j++) {
> +			/* Ignore non-integer tokens. */
> +			if (!(parsers[j].type == SND_SOC_TPLG_TUPLE_TYPE_WORD ||
> +			      parsers[j].type == SND_SOC_TPLG_TUPLE_TYPE_SHORT ||
> +			      parsers[j].type == SND_SOC_TPLG_TUPLE_TYPE_BYTE ||
> +			      parsers[j].type == SND_SOC_TPLG_TUPLE_TYPE_BOOL))
> +				continue;
> +
> +			if (parsers[j].token != le32_to_cpu(tuple->token))
> +				continue;
> +
> +			ret = parsers[j].parse(comp, tuple, object, parsers[j].offset);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int avs_parse_tokens(struct snd_soc_component *comp, void *object,
> +			    const struct avs_tplg_token_parser *parsers, size_t count,
> +			    struct snd_soc_tplg_vendor_array *tuples, int priv_size)
> +{
> +	int array_size, ret;
> +
> +	while (priv_size > 0) {
> +		array_size = le32_to_cpu(tuples->size);
> +
> +		if (array_size <= 0) {
> +			dev_err(comp->dev, "invalid array size 0x%x\n", array_size);
> +			return -EINVAL;
> +		}
> +
> +		/* Make sure there is enough data before parsing. */
> +		priv_size -= array_size;
> +		if (priv_size < 0) {
> +			dev_err(comp->dev, "invalid array size 0x%x\n", array_size);
> +			return -EINVAL;
> +		}
> +
> +		switch (le32_to_cpu(tuples->type)) {
> +		case SND_SOC_TPLG_TUPLE_TYPE_UUID:
> +			ret = avs_parse_uuid_tokens(comp, object, parsers, count, tuples);
> +			break;
> +		case SND_SOC_TPLG_TUPLE_TYPE_STRING:
> +			ret = avs_parse_string_tokens(comp, object, parsers, count, tuples);
> +			break;
> +		case SND_SOC_TPLG_TUPLE_TYPE_BOOL:
> +		case SND_SOC_TPLG_TUPLE_TYPE_BYTE:
> +		case SND_SOC_TPLG_TUPLE_TYPE_SHORT:
> +		case SND_SOC_TPLG_TUPLE_TYPE_WORD:
> +			ret = avs_parse_word_tokens(comp, object, parsers, count, tuples);

avs_parse_bool_token(struct snd_soc_component *comp, void *elem, void
*object, u32 offset)
avs_parse_byte_token(struct snd_soc_component *comp, void *elem, void
*object, u32 offset)
avs_parse_short_token(struct snd_soc_component *comp, void *elem, void
*object, u32 offset)

why did you introduce such helpers, if you only use word_tokens?

> +			break;
> +		default:
> +			dev_err(comp->dev, "unknown token type %d\n", tuples->type);
> +			ret = -EINVAL;
> +		}
> +
> +		if (ret) {
> +			dev_err(comp->dev, "parsing %ld tokens of %d type failed: %d\n",
> +				count, tuples->type, ret);
> +			return ret;
> +		}
> +
> +		tuples = avs_tplg_vendor_array_next(tuples);
> +	}
> +
> +	return 0;
> +}

> +static int parse_link_formatted_string(struct snd_soc_component *comp, void *elem,
> +				       void *object, u32 offset)
> +{
> +	struct snd_soc_tplg_vendor_string_elem *tuple = elem;
> +	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
> +	char *val = (char *)((u8 *)object + offset);
> +
> +	/*
> +	 * Dynamic naming - string formats, e.g.: ssp%d - supported only for
> +	 * topologies describing single device e.g.: an I2S codec on SSP0.
> +	 */

what are you trying to optimize here? the topology will contain the name
in all cases?

> +	if (hweight_long(mach->link_mask) != 1)
> +		return avs_parse_string_token(comp, elem, object, offset);
> +
> +	snprintf(val, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, tuple->string,
> +		 __ffs(mach->link_mask));
> +
> +	return 0;
> +}

> +struct avs_tplg {
> +	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
> +	u32 version;

version of what and where does it come from (manifest)?

does this contain an ABI information? if yes, how is it defined?

> +	struct snd_soc_component *comp;
> +
> +	struct avs_tplg_library *libs;
> +	u32 num_libs;
> +	struct avs_audio_format *fmts;
> +	u32 num_fmts;
> +	struct avs_tplg_modcfg_base *modcfgs_base;
> +	u32 num_modcfgs_base;
> +};
